class Comment < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }
  
  attr_accessible :message, :task_id, :user_id
  
  belongs_to :user
  belongs_to :task
end
