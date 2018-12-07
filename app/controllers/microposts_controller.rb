class MicropostsController < ApplicationController
    before_filter :correct_user,   only: :destroy
    
    def index
    end
  
    def create
        @micropost = current_user.microposts.build(params[:micropost])
      respond_to do |format|
        if @micropost.save
          format.html  { redirect_to(:back,
                                     :notice => 'Lumination was successfully created.') }
          format.json  { render :json => @micropost,
                         :status => :created, :location => @micropost }
        else
          format.html  { render :action => "new" }
          format.json  { render :json => @micropost.errors,
                         :status => :unprocessable_entity }
        end
      end
    end

    def destroy
      @micropost.destroy
      redirect_to :back
    end

    private
      def correct_user
        @micropost = current_user.microposts.find_by_id(params[:id])
        redirect_to root_path if @micropost.nil?
      end
end
