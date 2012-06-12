class TopicsController < ApplicationController
  def show
  end
  def index
    @requests = Request.all
    @contact = Contact.new
  end
  def new
   
  end
end