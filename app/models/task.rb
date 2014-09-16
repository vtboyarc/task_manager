class Task < ActiveRecord::Base
  attr_accessible :description, :due_date, :name, :priority, :project_id, :tag_id, :user_id
  
  belongs_to :user
end