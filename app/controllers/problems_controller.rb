class ProblemsController < ApplicationController
  before_filter :find_problem, :except => [:index, :new, :create]
  helper_method :sort_column, :sort_direction, :vote
  
  def index
    @problems = Problem.problem_search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 4, :page => params[:page])
    @users = User.all
    @search = params[:search]
  end

  def show
    @problem = Problem.find(params[:id])
    @problem = @commentable = Problem.find(params[:id])
    respond_to do |format|
      format.html  # show.html.erb
      format.json  { render :json => @problem }
    end
  end

  def new
    @problem = Problem.new
    respond_to do |format|
      format.html  # new.html.erb
      format.json  { render :json => @problem }
    end
  end

  def create
    @problem = current_user.problems.build(params[:problem])

    respond_to do |format|
      if @problem.save
        format.html  { redirect_to(@problem,
                      :notice => 'Problem was successfully created.') }
        format.json  { render :json => @problem,
                      :status => :created, :location => @problem }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @problem.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

    def update
      respond_to do |format|
        if @problem.update_attributes(params[:problem])
          format.html  { redirect_to(@problem,
                        :notice => 'Problem was successfully updated.') }
          format.json  { head :no_content }
        else
          format.html  { render :action => "edit" }
          format.json  { render :json => @problem.errors,
                        :status => :unprocessable_entity }
        end
      end
    end

      def destroy
        @problem.destroy

        respond_to do |format|
          format.html { redirect_to problems_url }
          format.json { head :no_content }
        end
      end
      
        def vote
          if params[:up]
            current_user.cast_problem_vote(@problem, 1)
          else
            current_user.cast_problem_vote(@problem, -1)
          end
          render :show
        end
      
      private
      def find_problem
        @problem = Problem.find(params[:id])
      end

      def sort_column
        Problem.column_names.include?(params[:sort]) ? params[:sort] : "title"
      end

      def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
      end
end
