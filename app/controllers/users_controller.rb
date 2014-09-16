class UsersController < ApplicationController
  
  skip_before_filter :authorize, :only => [:new, :create]
  
   def index
     @users = User.all
   end
  
  def new
    @user = User.new
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
    @user = User.find(params[:id])
    if @user == current_user
      redirect_to root_path, alert: "Users cannot delete themselves."
    else
      @user.delete
    redirect_to users_path, notice: "User successfully deleted."
  end
  
  end
end
