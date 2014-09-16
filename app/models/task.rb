class Task < ActiveRecord::Base
  attr_accessible :description, :due_date, :name, :priority
  
  belongs_to :user
end