class ContactsController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  def index
    @contacts = Contact.contact_search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 4, :page => params[:page])
    @users = User.all
    @search = params[:search]
  end

  def show
    @contact = Contact.find(params[:id])
    respond_to do |format|
      format.html  # show.html.erb
      format.json  { render :json => @contact }
    end
  end

  def new
    @contact = Contact.new
    respond_to do |format|
      format.html  # new.html.erb
      format.json  { render :json => @contact }
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def create
    @contact = current_user.contacts.build(params[:contact])

    respond_to do |format|
      if @contact.save
        format.html  { redirect_to(@contact,
                      :notice => 'Contact was successfully created.') }
        format.json  { render :json => @contact,
                      :status => :created, :location => @contact }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @contact.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

    def update
      @contact = Contact.find(params[:id])

      respond_to do |format|
        if @contact.update_attributes(params[:contact])
          format.html  { redirect_to(@contact,
                        :notice => 'Contact was successfully updated.') }
          format.json  { head :no_content }
        else
          format.html  { render :action => "edit" }
          format.json  { render :json => @contact.errors,
                        :status => :unprocessable_entity }
        end
      end
    end

      def destroy
        @contact = Contact.find(params[:id])
        @contact.destroy

        respond_to do |format|
          format.html { redirect_to contacts_url }
          format.json { head :no_content }
        end
      end
      
      private

      def sort_column
        Contact.column_names.include?(params[:sort]) ? params[:sort] : "subject"
      end

      def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
      end
end
