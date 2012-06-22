class IdeasController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  def index
    @ideas = Idea.idea_search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 4, :page => params[:page])
    @users = User.all
    @search = params[:search]
  end

  def show
    @idea = Idea.find(params[:id])
    @users = User.all
    @idea = @commentable = Idea.find(params[:id])
    respond_to do |format|
      format.html  # show.html.erb
      format.json  { render :json => @idea }
    end
  end

  def new
    @idea = Idea.new
    respond_to do |format|
      format.html  # new.html.erb
      format.json  { render :json => @idea }
    end
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def create
    @idea = current_user.ideas.build(params[:idea])

    respond_to do |format|
      if @idea.save
        format.html  { redirect_to(@idea,
                      :notice => 'Idea was successfully created.') }
        format.json  { render :json => @idea,
                      :status => :created, :location => @idea }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @idea.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

    def update
      @idea = Idea.find(params[:id])

      respond_to do |format|
        if @idea.update_attributes(params[:idea])
          format.html  { redirect_to(@idea,
                        :notice => 'Idea was successfully updated.') }
          format.json  { head :no_content }
        else
          format.html  { render :action => "edit" }
          format.json  { render :json => @idea.errors,
                        :status => :unprocessable_entity }
        end
      end
    end

      def destroy
        @idea = Idea.find(params[:id])
        @idea.destroy

        respond_to do |format|
          format.html { redirect_to ideas_url }
          format.json { head :no_content }
        end
      end
      
      private

      def sort_column
        Idea.column_names.include?(params[:sort]) ? params[:sort] : "title"
      end

      def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
      end
end
