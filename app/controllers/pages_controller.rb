class PagesController < ApplicationController
  def home
    if signed_in?
      @micropost = current_user.microposts.build if signed_in?
      @feed_items = current_user.feed.paginate(page: params[:page])
      @user = current_user
    end
  end

  def about
  end

  def contact
    def new
      @message = Message.new
    end

    def create
      @message = Message.new(params[:message])
      if @message.valid?
        # TODO send message here
        redirect_to root_url, notice: "Message sent! Thank you for contacting us."
      else
        render "new"
      end
    end
  end

  def privacy
  end

  def terms
  end
end
