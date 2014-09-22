class TasksController < ApplicationController

  skip_before_filter :authorize, :only => [:index, :show]
 
  def index
    @tasks = Task.all
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
      Pony.mail({
                :to => "#{@user.email}",
                :via => :smtp,
                :subject => "#{current_user.name}" + " has changed/updated a task.",
                :body => "Please visit Task Manager and review Task: " + "#{@task.name}" + ".\n\nTask Description: " + "#{@task.description}",
                :via_options => {
                  :address              => 'smtp.gmail.com',
                  :port                 => '587',
                  :enable_starttls_auto => true,
                  :user_name            => 'taskinc.taskmanager@gmail.com',
                  :password             => 'ocsbudai',
                  :authentication       => :plain, 
                  :domain               => "localhost.localdomain" 
        
                  }
                })
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
