class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  
  has_secure_password
  
  validates_presence_of :password, :on => :create
  
  def current_user
    if session[:user_id]
      @user_id ||= User.find(session[:user_id])
    end
  end
end
