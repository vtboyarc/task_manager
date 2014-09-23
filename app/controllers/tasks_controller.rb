class TasksController < ApplicationController

  skip_before_filter :authorize, :only => [:index, :show]
 
  def index
    # @tasks = Task.all
    @tasks = Task.includes(:comments => :project).all
  end
  
  def find
    @task = Task.new
  end
  
  def new
    @task = Task.new
    @projects = Project.all
    @tags = Tag.all
    @users = User.all
  end
 
  def create
 
     @task = Task.new(params[:task])
    
     # TODO Figure out why this is here. 
     @task.project_id = (params[:task][:project_id]).to_i
     @task.tag_id = (params[:task][:tag_id]).to_i
     @task.user_id = (params[:task][:user_id]).to_i
     @task.completed = (params[:task][:completed])
    
     @user = User.find(@task.user_id)
     if @task.save
       UserMailer.task(@user).deliver
                     @project = Project.find(@task.project_id)
             redirect_to project_path(@project.name), notice: "Your email notification to #{@user.name} was sent successfully."
            else
             render "new", alert: "Invalid. Your task was not added."
     end 
   end
    
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @users = User.all
    @task = Task.find(params[:id])
    @user = User.find(@task.user_id)
    
    if @task.update_attributes(params[:task])
        UserMailer.update_task(@user).deliver
       @project = Project.find(@task.project_id)

      redirect_to project_path(@project.name), :notice => "Your email notification to #{@user.name} was sent successfully."
    else
      render "edit", alert: "Invalid. Your task was not updated."
    end
        
  end

  def destroy
    @task = Task.find(params[:id])
    @task.delete
    redirect_to tasks_path, :notice => "You have deleted this task."
  end

  
  def show
    @task = Task.find(params[:id])
    @project = Project.find(@task.project_id)
    @tag = Tag.find(@task.tag_id)
    @comments = Comment.new
    @user = User.find(@task.user_id)
    
    if @task.completed
      @response = "Yes! Good work!"
    else
      @response = "No"
    end
  end
  
  
  
end
