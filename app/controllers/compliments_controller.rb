class ComplimentsController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  def index
    @compliments = Compliment.all
  end

  def show
    @compliment = Compliment.find(params[:id])
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

  def edit
    @compliment = Compliment.find(params[:id])
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
      @compliment = Compliment.find(params[:id])

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
        @compliment = Compliment.find(params[:id])
        @compliment.destroy

        respond_to do |format|
          format.html { redirect_to compliments_url }
          format.json { head :no_content }
        end
      end
      
      private

      def sort_column
        Compliment.column_names.include?(params[:sort]) ? params[:sort] : "title"
      end

      def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
      end
end
