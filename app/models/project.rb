class Project < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }
  
  attr_accessible :name, :desc
  
  has_many :tasks
  
  belongs_to :user
end