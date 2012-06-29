class CategoriesController < ApplicationController
    before_filter :find_category, :except => [:index, :new, :create]

    def index
      @categories = Category.all
    end

    def show
      @post = Post.all
      respond_to do |format|
        format.html  # show.html.erb
        format.json  { render :json => @post }
      end
    end

    def new
      @category = Category.new

      respond_to do |format|
        format.html  # new.html.erb
        format.json  { render :json => @post }
      end
    end

    def edit
    end

    def create
      @category = Category.new(params[:category])

      respond_to do |format|
        if @category.save
          format.html  { redirect_to(@category,
                        :notice => 'Category was successfully created.') }
          format.json  { render :json => @category,
                        :status => :created, :location => @category }
        else
          format.html  { render :action => "new" }
          format.json  { render :json => @category.errors,
                        :status => :unprocessable_entity }
        end
      end
    end

      def update
        respond_to do |format|
          if @category.update_attributes(params[:category])
            format.html  { redirect_to(@category,
                          :notice => 'Category was successfully updated.') }
            format.json  { head :no_content }
          else
            format.html  { render :action => "edit" }
            format.json  { render :json => @category.errors,
                          :status => :unprocessable_entity }
          end
        end
      end

        def destroy
          @category.destroy

          respond_to do |format|
            format.html { redirect_to categories_url }
            format.json { head :no_content }
          end
        end
  
  private
  
  def find_category
    @category = Category.find(params[:id])
  end


end

