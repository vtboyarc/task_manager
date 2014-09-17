class TagsController < ApplicationController
  
  skip_before_filter :authorize, :only => [:index, :show]

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(params[:tag])

    if @tag.save
      redirect_to tags_path(@tag.id), :notice => "You have saved a new tag."
    else
      render "new"
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])

    if @tag.update_attributes(params[:tag])
      redirect_to tags_path(@tag.id), :notice => "You have upated this tag."
    else
      render "edit"
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.delete
    redirect_to tags_path, :notice => "You have deleted this tag."
  end


  def show
    @tag = Tag.find(params[:id])
  end
  
end
