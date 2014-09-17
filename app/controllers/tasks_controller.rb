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
    @user = User.where(id: params[:task][:user_id])
    @projects = Project.all
    @tags = Tag.all
    @users = User.all
    binding.pry
    if @task.save
      binding.pry
      Pony.mail(:to => "ocs.budai@gmail.com", :from => 'taskinc.taskmanager@gmail.com', :subject => 'Task Alert', :body => 'You have been assigned a new task #{@task.name}.')
      binding.pry
      redirect_to tasks_path(@task.id), :notice => "You have saved a new task."
    else
      render "new"
    end
  end 
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    @user = User.where({id: params[:task][:user_id]})
    @projects = Project.all
    @tags = Tag.all
    @users = User.all
    @email = Email.all
    
    if @task.update_attributes(params[:task])
      Pony.mail(:to => @user.email, :from => 'taskinc.taskmanager@gmail.com', :subject => 'Task Alert', :body => 'Your task #{@task.name} has been updated.')
      
      redirect_to tasks_path(@task.id), :notice => "You have upated this task."
    else
      render "edit"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    redirect_to tasks_path, :notice => "You have deleted this task."
  end

  
  def show
    @task = Task.find(params[:id])
    @project = Project.find(@task.project_id)
    @tag = Tag.find(@task.tag_id)
    @user = User.find(@task.user_id)
  end
  
  
  
end
