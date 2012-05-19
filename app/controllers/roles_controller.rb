class RolesControllerController < ApplicationController
  def index
  end

  def new
    @role = Role.new

    respond_to do |format|
      format.html  # new.html.erb
      format.json  { render :json => @post }
    end
  end

  def edit
  end
end
