class ProjectsController < ApplicationController
  
  skip_before_filter :authorize, :only => [:index, :show]
 
  def index
    @projects = Project.all
  end
  
  def new
    @project = Project.new
  end
 
  def create
    @project = Project.new(params[:project])
    
    if @project.save
      redirect_to projects_path(@project.name), :notice => "You have saved a new project."
    else
      render "new"
    end
  end
  
  def edit
    @project = Project.find_by_name(params[:name])
  end
  
  def update
    @project = Project.find_by_name(params[:project][:name])
    
    if @project.update_attributes(params[:project])
      redirect_to project_path(@project.name), :notice => "You have upated this project."
    else
      render "edit"
    end
  end

  def destroy
    @project = Project.find_by_name(params[:name])
    @project.delete
    redirect_to projects_path, :notice => "You have deleted this project."
  end
  
  
  def show
    @project = Project.find_by_name(params[:name])
    @task = Task.new
  end
end
