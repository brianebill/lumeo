class CommentsController < ApplicationController
  def index
    @commentable = find_commentable
    @comments = @commentable.comments
  end

  def new
    @post = Post.find(params[:post_id])
  end
  
  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(params[:comment])
    if @comment.save
      flash[:notice] = "Successfully created comment."
      redirect_to :id => nil
    else
      render :action => 'new'
    end
  end

  private

  def find_commentable
    if params[:post_id]
      Post.find(params[:post_id])
    #elsif params[:other_id]
    #  Other.find(params[:other_id])
    else
      # error out?
    end
  end
end