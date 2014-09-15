class UsersController < ApplicationController
  
   skip_before_filter :authorize
  
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
  
  def create
    @user = User.new(params[:user])
    
    if @user.save
      redirect_to users_path(@user.id)
    else
      render "new"
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update_attributes(params[:user])
      redirect_to users_path(@user.id)
    else
      render "edit"
    end
  end
  
  def show
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).delete
    redirect_to users_path
  end
end
