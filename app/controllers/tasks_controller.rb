class TasksController < ApplicationController

  skip_before_filter :authorize, :only => [:new, :create]
 
  def index
    @tasks = Task.all
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
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    
    if @task.update_attributes(params[:task])
      redirect_to tasks_path(@task.id), notice: => "Updated this, you have"
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
