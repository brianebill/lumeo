class PostsController < ApplicationController
  def index
    @posts = Post.all
    @categories = Category.all
  end

  def show
    @post = Post.find(params[:id])
    @post = @commentable = Post.find(params[:id])
    respond_to do |format|
      format.html  # show.html.erb
      format.json  { render :json => @post }
    end
  end

  def new
    @category = Category.all
    @post = Post.new
    @image = @post.images.build
  end

    # GET /courses/1/edit
    def edit
    end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])

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
        @post = Post.find(params[:id])
        @post.destroy

        respond_to do |format|
          format.html { redirect_to posts_url }
          format.json { head :no_content }
        end
      end
end
