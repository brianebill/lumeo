class PostsController < ApplicationController
  before_filter :find_categories, :only => [:index, :new]
  before_filter :find_post, :except => [:index, :create, :new]

  def index
    @posts = Post.all
  end

  def show
    @post = @commentable = Post.find(params[:id])
    @comments = @commentable.comments
    @posts = Post.all
    respond_to do |format|
      format.html  # show.html.erb
      format.json  { render :json => @post }
    end
  end

  def new
    @post = Post.new
    @image = @post.build_image
  end

  def create
    @post = current_user.posts.build(params[:post])

    respond_to do |format|
      if @post.save
        format.html  { redirect_to(@post,
                      :notice => 'Post was successfully created.') }
        format.json  { render :json => @post,
                      :status => :created, :location => @post }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @post.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  protected

  def find_categories
    @categories = Category.all
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
