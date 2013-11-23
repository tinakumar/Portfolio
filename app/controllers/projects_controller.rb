class ProjectsController < ApplicationController


def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

 def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.js
    end
  end

   def edit
    @project = Project.find(params[:id])

  end

  def create
    @project = Project.create!(params[:project])
    respond_to do |format|
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.js
    end
  end


  def show
    @project = Project.find(params[:id])
    @commentable = @project
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(params[:project])
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.js
    end
  end


end
