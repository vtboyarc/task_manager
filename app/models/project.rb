class Project < ActiveRecord::Base
  attr_accessible :name, :desc
  
  has_many :tasks
  
end