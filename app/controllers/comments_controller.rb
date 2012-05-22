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
    params.each do |name, value|
      if name =~ /(.+)_attributes$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end