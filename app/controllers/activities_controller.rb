class ActivitiesController < ApplicationController
  def index
    @activities = PublicActivity::Activity.order("created_at desc")
 
  end
end


# @users = User.All
# @user.id = @task.user_id
#
# @user.id = @task.where(params[:task][:user_id])