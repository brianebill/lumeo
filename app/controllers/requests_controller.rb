class RequestsController < ApplicationController
  before_filter :find_request, :except => [:index, :new, :create]
  helper_method :sort_column, :sort_direction, :vote, :counts

  def index
    @requests = Request.request_search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 25, :page => params[:page])
    @users = User.all
    @search = params[:search]
  end

  def show
    @request = @commentable = Request.find(params[:id])
    respond_to do |format|
      format.html  # show.html.erb
      format.json  { render :json => @request }
    end
  end

  def new
    @request = Request.new
    respond_to do |format|
      format.html  # new.html.erb
      format.json  { render :json => @request }
    end
  end

  def create
    @request = current_user.requests.build(params[:request])

    respond_to do |format|
      if @request.save
        format.html  { redirect_to(@request,
                                   :notice => 'Request was successfully created.') }
        format.json  { render :json => @request,
                       :status => :created, :location => @request }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @request.errors,
                       :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @request.update_attributes(params[:request])
        format.html  { redirect_to(@request,
                                   :notice => 'Request was successfully updated.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @request.errors,
                       :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @request.destroy

    respond_to do |format|
      format.html { redirect_to requests_url }
      format.json { head :no_content }
    end
  end

  def vote
    if params[:up]
      current_user.cast_request_vote(@request, 1)
    else
      current_user.cast_request_vote(@request, -1)
    end
    render :show
  end

  protected

  def find_request
    @request = Request.find(params[:id])
  end

  def sort_column
    Request.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
