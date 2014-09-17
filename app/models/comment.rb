class Comment < ActiveRecord::Base
  attr_accessible :message, :task_id, :user_id
end
