class RegisteredApplicationsController < ApplicationController
  def index
    @registered_applications = RegisteredApplication.all
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])  
  end
  
  def new
    @registered_application = RegisteredApplication.new  
  end
  
  def create
    @user                        = current_user
    @registered_application      = @user.registered_applications.build(post_params)
    @registered_application.user = current_user
    
    if @registered_application.save
      flash[:notice] = "Application is registered successfully."
      redirect_to :root
    else
      flash.now[:alert] = "There was an error registering the app. Please try again."
      render :new
    end
  end

  def destroy
  end
  
  def post_params
    params.require(:registered_application).permit(:name, :url)
  end
  
end
