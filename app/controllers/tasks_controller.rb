class TasksController < ApplicationController

  skip_before_filter :authorize, :only => [:new, :create]
 
  def index
    @task = Task.all
  end
  
  def new
    @task = Task.new
  end
 
  def create
    @task = Task.new(params[:task])
    
    if @task.save
      redirect_to tasks_path(@task.id)
    else
      render "new"
    end
  end
  
  def edit
    @existing_task = Task.find(params[:id])
  end
  
  def update
    @existing_task = Task.find(params[:id])
    
    if @existing_task.update_attributes(params[:task])
      redirect_to tasks_path(@existing_task.id)
    else
      render "edit"
    end
  end
  
  def show
    @task = Task.find(params[:id])
  end

  def destroy
    Task.find(params[:id]).delete
    redirect_to tasks_path
  end
  
end
