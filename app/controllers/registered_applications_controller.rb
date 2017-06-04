class RegisteredApplicationsController < ApplicationController
  def index
    @user                    = current_user
    @registered_applications = @user.registered_applications
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])  
    @events = @registered_application.events.group_by(&:name)
  end
  
  def new
    @registered_application = RegisteredApplication.new  
  end
  
  def create
    @user                        = current_user
    @registered_application      = @user.registered_applications.build(post_params)
    @registered_application.user = current_user
    
    if @registered_application.save
      flash[:notice]    = "Application is registered successfully."
      redirect_to :root
    else
      flash.now[:alert] = "There was an error registering the app. Please try again."
      render :new
    end
  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])
     
     if @registered_application.destroy
       flash[:notice]    = "\"#{@registered_application.name}\" was deleted successfully."
       redirect_to root_path
     else
       flash.now[:alert] = "There was an error deleting the app."
       render :index
     end
  end
  
  def post_params
    params.require(:registered_application).permit(:name, :url)
  end
  
end
