class UsersController < ApplicationController
  
  skip_before_filter :authorize, :only => [:new, :create]
  
   def index
     @users = User.all
   end
   
   def find
     @user = User.new
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
    if @user != current_user
      redirect_to users_path, alert: "Users cannot edit other users."
    end
  end
  
  
  
  def update
    @user = User.find(params[:id])
    
    if @user != current_user
      redirect_to users_path, alert: "Users cannot edit other users."
    else
      if @user.update_attributes(params[:user])
        redirect_to users_path(@user.id), notice: "User successfully updated."
      else
        render "edit", alert: "Invalid. Please try again."
      end
    end
  end
  
  def show
    @user = User.find(params[:id])
    
  end

  def destroy
    @user = User.find(params[:id])
    
    if @user != current_user
      redirect_to users_path, alert: "Users cannot delete other users."
    else
      @user.delete
    redirect_to users_path, notice: "User successfully deleted."
    end
  end
  
end
