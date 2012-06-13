class RequestsController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  def index
    @requests = Request.request_search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 4, :page => params[:page])
    @users = User.all
    @search = params[:search]
  end

  def show
    @request = Request.find(params[:id])
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

  def edit
    @request = Request.find(params[:id])
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
      @request = Request.find(params[:id])

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
        @request = Request.find(params[:id])
        @request.destroy

        respond_to do |format|
          format.html { redirect_to requests_url }
          format.json { head :no_content }
        end
      end
      
      private

      def sort_column
        Request.column_names.include?(params[:sort]) ? params[:sort] : "title"
      end

      def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
      end
end
