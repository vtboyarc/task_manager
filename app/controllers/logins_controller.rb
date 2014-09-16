class LoginsController < ApplicationController
   skip_before_filter :authorize
 
  def new
  end
  
  def create
    @user = User.find_by_email(params[:email])
    
      if @user && @user.authenticate(params[:password]) #if user && is to keep from being nil
        session[:user_id] = @user.id

        redirect_to tasks_path, notice: "Welcome back."
      else
        render "new", alert: "Invalid log in, please try again"
      end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to tasks_path
  end
end
