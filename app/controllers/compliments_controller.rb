class ComplimentsController < ApplicationController
  before_filter :find_compliment, :except => [:index, :new, :create]
  helper_method :sort_column, :sort_direction, :vote
  
  def index
    @users = User.all
    @compliments = Compliment.compliment_search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 4, :page => params[:page])
    @search = params[:search]
  end

  def show
    @compliment = @commentable = Compliment.find(params[:id])
    respond_to do |format|
      format.html  # show.html.erb
      format.json  { render :json => @compliment }
    end
  end

  def new
    @compliment = Compliment.new
    respond_to do |format|
      format.html  # new.html.erb
      format.json  { render :json => @compliment }
    end
  end

  def create
    @compliment = current_user.compliments.build(params[:compliment])

    respond_to do |format|
      if @compliment.save
        format.html  { redirect_to(@compliment,
                      :notice => 'Compliment was successfully created.') }
        format.json  { render :json => @compliment,
                      :status => :created, :location => @compliment }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @compliment.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

    def update
      respond_to do |format|
        if @compliment.update_attributes(params[:compliment])
          format.html  { redirect_to(@compliment,
                        :notice => 'Compliment was successfully updated.') }
          format.json  { head :no_content }
        else
          format.html  { render :action => "edit" }
          format.json  { render :json => @compliment.errors,
                        :status => :unprocessable_entity }
        end
      end
    end

      def destroy
        @compliment.destroy

        respond_to do |format|
          format.html { redirect_to compliments_url }
          format.json { head :no_content }
        end
      end
      
      def vote
        if params[:up]
          current_user.cast_compliment_vote(@compliment, 1)
        else
          current_user.cast_compliment_vote(@compliment, -1)
        end
        render :show
      end

      private

      def find_compliment
        @compliment = Compliment.find(params[:id])
      end

      def sort_column
        Compliment.column_names.include?(params[:sort]) ? params[:sort] : "title"
      end

      def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
      end
end
