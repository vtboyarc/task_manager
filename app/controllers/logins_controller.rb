class LoginsController < ApplicationController
   skip_before_filter :authorize, :only => [:new, :create]
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    
      if user && user.authenticate(params[:password]) #if user && is to keep from being nil
        session[:user_id] = user.id
<<<<<<< HEAD
        redirect_to articles_path
=======
        redirect_to root_path
>>>>>>> 851116494c5648c791388bb56c0f37d5a5ab29d3
      else
        raise "Invalid login."
      end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
