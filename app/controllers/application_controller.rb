class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  
  protect_from_forgery

  before_filter :authorize

  def authorize
    if current_user.nil?
      redirect_to login_path, :alert => "You need to log in first!"
    end
  end  

  
  def current_user
    # binding.pry
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
      # binding.pry
      # if @current_user.nil?
  #       reset_session
  #       redirect_to login_path, :alert => "You need to log in first!"
  #     end
    end
  end
  
  #this allows the current_user method to be available in all the views
  helper_method :current_user
  hide_action :current_user
  
end
