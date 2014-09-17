class CommentsController < ApplicationController
  
  skip_before_filter :authorize, :only => [:index, :show]
 
  def index
    @comments = Comment.all
  end
  
  def new
    @comment = Comment.new
    @tasks = Tag.all
    @users = User.all
  end
 
  def create
    @comment = Comment.new(params[:comment])
    
    if @comment.save
      redirect_to task_path(@comment.task_id), :notice => "You have saved a new comment."
    else
      render "new"
    end
  end
  
  def edit
    @comment = Comment.find(params[:id])
    @task = Task.find(@comment.task_id)
  end
  
  def update
    @comment = Comment.find(params[:id])
    @task = Task.find(@comment.task_id)
    
    if @comment.update_attributes(params[:comment])
      redirect_to task_path(@comment.task_id), :notice => "You have upated this comment."
    else
      render "edit"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @task = Task.find(@comment.task_id)
    @comment.destroy
    redirect_to task_path(@task), :notice => "You have deleted this comment."
  end

  
  def show
    @comment = Comment.find(params[:id])
    @user = User.find(@comment.user_id)
    @task = Tag.find(@comment.task_id)
  end
  
end
