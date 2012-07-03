class TagsController < ApplicationController
    before_filter :find_tag, :except => [:index, :new, :create]
    before_filter :find_requests, :only => [:index, :show]
    before_filter :find_questions, :only => [:index, :show]
    before_filter :find_ideas, :only => [:index, :show]

    def index
      @tags = Tag.all
    end

    def show
      @tags = Tag.all
      respond_to do |format|
        format.html  # show.html.erb
        format.json  { render :json => @post }
      end
    end

    def new
      @tag = Tag.new

      respond_to do |format|
        format.html  # new.html.erb
        format.json  { render :json => @post }
      end
    end

    def edit
    end

    def create
      @tag = Tag.new(params[:tag])

      respond_to do |format|
        if @tag.save
          format.html  { redirect_to(@tag,
                        :notice => 'Tag was successfully created.') }
          format.json  { render :json => @tag,
                        :status => :created, :location => @tag }
        else
          format.html  { render :action => "new" }
          format.json  { render :json => @tag.errors,
                        :status => :unprocessable_entity }
        end
      end
    end

      def update
        respond_to do |format|
          if @tag.update_attributes(params[:tag])
            format.html  { redirect_to(@tag,
                          :notice => 'Tag was successfully updated.') }
            format.json  { head :no_content }
          else
            format.html  { render :action => "edit" }
            format.json  { render :json => @tag.errors,
                          :status => :unprocessable_entity }
          end
        end
      end

        def destroy
          @tag.destroy

          respond_to do |format|
            format.html { redirect_to tags_url }
            format.json { head :no_content }
          end
        end
  
  private
  
  def find_requests
    @requests = Request.all
  end
  def find_questions
    @questions = Question.all
  end
  def find_ideas
    @ideas = Idea.all
  end
  def find_tag
    @tag = Tag.find(params[:id])
  end


end

