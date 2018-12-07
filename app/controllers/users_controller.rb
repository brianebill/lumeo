class UsersController < ApplicationController
  before_filter :find_user, :except => [:index, :destroy]
  
  def index
    @roles = Role.all
    @users = User.paginate(page: params[:page])
    @votes = Vote.all
  end
  
  def show
    @microposts = @user.microposts.paginate(page: params[:page])
    @micropost = current_user.microposts.build if signed_in?
    @feed_items = current_user.feed.paginate(page: params[:page])
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end
  
  def following
    @title = "Following"
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  
  def update
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, 
                      notice: 'Member was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, 
                      status: :unprocessable_entity }
      end
    end
  end
  
  private 
  def find_user
    @user = User.find(params[:id])
  end
end
