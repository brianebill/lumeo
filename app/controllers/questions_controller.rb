class QuestionsController < ApplicationController
  before_filter :find_question, :except => [:index, :new, :create]
  helper_method :sort_column, :sort_direction, :vote
  
  def index
    @questions = Question.question_search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 20, :page => params[:page])
    @users = User.all
    @search = params[:search]
  end

  def show
    @question = @commentable = Question.find(params[:id])
    respond_to do |format|
      format.html  # show.html.erb
      format.json  { render :json => @question }
    end
  end

  def new
    @question = Question.new
    respond_to do |format|
      format.html  # new.html.erb
      format.json  { render :json => @question }
    end
  end

  def create
    @question = current_user.questions.build(params[:question])

    respond_to do |format|
      if @question.save
        format.html  { redirect_to(@question,
                      :notice => 'Question was successfully created.') }
        format.json  { render :json => @question,
                      :status => :created, :location => @question }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @question.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

    def update
      respond_to do |format|
        if @question.update_attributes(params[:question])
          format.html  { redirect_to(@question,
                        :notice => 'Question was successfully updated.') }
          format.json  { head :no_content }
        else
          format.html  { render :action => "edit" }
          format.json  { render :json => @question.errors,
                        :status => :unprocessable_entity }
        end
      end
    end

      def destroy
        @question.destroy

        respond_to do |format|
          format.html { redirect_to questions_url }
          format.json { head :no_content }
        end
      end
      
      def vote
        if params[:up]
          current_user.cast_question_vote(@question, 1)
        else
          current_user.cast_question_vote(@question, -1)
        end
        redirect_to params[:redirect] == 'index' ? questions_path : @question
      end
      
      private
      
      def find_question
        @question = Question.find(params[:id])
      end

      def sort_column
        Question.column_names.include?(params[:sort]) ? params[:sort] : "title"
      end

      def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
      end
end
