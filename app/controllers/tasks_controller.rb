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
      @task.project_id = (params[:project_id]).to_i
      @task.category_id = (params[:category_id]).to_i
      @task.user_id = (params[:user_id]).to_i
      @user = User.find(@task.user_id)
      @task.email = current_user.email
      if @task.save
        if @user.email == ""
          "Your Email isn't working!"
        else        
          Pony.mail({
            :to => "#{@user.email}",
            :via => :smtp,
            :subject => "#{current_user.email}" + "has assigned you a task.",
            :body => "Your task is " + "#{@task.description}",
            :via_options => {
              :address              => 'smtp.gmail.com',
              :port                 => '587',
              :enable_starttls_auto => true,
              :user_name            => 'taskinck_email(without the @gmail.com part)',
              :password             => 'what_you_made_for_password_for_the_acccount',
              :authentication       => :plain, 
              :domain               => "localhost.localdomain" 
        
              }
            })
          end
        redirect_to tasks_path, notice: "Your email notification has been sent successfully."
      else
        render "new", alert: "Invalid. Your task was not added."
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
