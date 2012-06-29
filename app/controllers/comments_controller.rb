class CommentsController < ApplicationController
  before_filter :find_comment, :except => [:index, :new, :create]
  def index
    @commentable = find_commentable
    @comments = @commentable.comments
  end

  def new
  end
  
  def show
  end
  
  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(params[:comment])
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Successfully created comment."
      redirect_to :id => nil
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @comment.destroy
    flash[:notice] = "Successfully destroyed comment."
    redirect_to :id => nil
  end

  private
  
  def find_comment
    @comment = Comment.find(params[:id])
  end

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end