class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_and_belongs_to_many :tasks
  has_many :comments
  
  has_secure_password
  
  validates :email, uniqueness: true
  validates :email, :password, :password_confirmation, presence: true
  
end
