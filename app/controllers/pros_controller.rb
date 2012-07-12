class ProsController < ApplicationController
  before_filter :find_pro, :except => [:index, :new, :create]
  helper_method :sort_column, :sort_direction, :vote, :model_name

  def index
    @pros = Pro.pro_search(params[:search])
    @users = User.all
    @search = params[:search]
  end
  
  def edit
  end

  def show
    @pros = Pro.all
    @courses = Course.all
    respond_to do |format|
      format.html  # show.html.erb
      format.json  { render :json => @pro }
    end
  end

  def new
    @pro = Pro.new
    @image = @pro.build_image
    1.times { @pro.tags.build }
    respond_to do |format|
      format.html  # new.html.erb
      format.json  { render :json => @pro }
    end
  end

  def create
    @user = current_user
    @pro = Pro.create(params[:pro])
    @user.pro = @pro

    respond_to do |format|
      if @pro.save
        format.html  { redirect_to(@pro,
                                   :notice => 'Pro was successfully created.') }
        format.json  { render :json => @pro,
                       :status => :created, :location => @pro }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @pro.errors,
                       :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @pro.update_attributes(params[:pro])
        format.html  { redirect_to(@pro,
                                   :notice => 'Pro was successfully updated.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @pro.errors,
                       :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @pro.destroy

    respond_to do |format|
      format.html { redirect_to pros_url }
      format.json { head :no_content }
    end
  end

  def vote
    if params[:up]
      current_user.cast_pro_vote(@pro, 1)
    else
      current_user.cast_pro_vote(@pro, -1)
    end

    redirect_to params[:redirect] == 'index' ? pros_path : @pro
  end
  
  def model_name
      @model_name = self.class.name.sub("Controller", "")
  end

  protected

  def find_pro
    @pro = Pro.find(params[:id])
  end
end
