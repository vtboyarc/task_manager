class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_and_belongs_to_many :tasks
  
  has_secure_password
  
  validates :email, uniqueness: true
  validates :email, :password, :password_confirmation, presence: true
  
  def current_user
    if session[:user_id]
      @user_id ||= User.find(session[:user_id])
    end
  end
  
  def notify_user
  end
  
  
  
end
