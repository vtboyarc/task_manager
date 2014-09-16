class TasksController < ApplicationController

  skip_before_filter :authorize, :only => [:index, :show]
 
  def index
    @tasks = Task.all
  end
  
  def new
    @task = Task.new
  end
 
  def create
    @task = Task.new(params[:task])
    
    if @task.save
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
    
    if @task.update_attributes(params[:task])
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
  end
  
end
