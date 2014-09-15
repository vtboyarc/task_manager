class UsersController < ApplicationController
  
   skip_before_filter :authorize, :only => [:new, :create]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    
    if @user.save
      redirect_to tasks_path
    else
      raise "user wasn't saved"
    end
  end
end
