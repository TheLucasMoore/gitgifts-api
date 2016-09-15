class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    respond_to do |format|
      format.any { render json: @project }
    end
  end

  def index
    @projects = Project.all
    respond_to do |format|
      format.any { render json: @projects }
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)
    @project.user = current_user
    if @project.save
      respond_to do |format|
        format.any { render json: @project }
      end
    end
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)

    respond_to do |format|
      format.any { render json: @project }
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :goal)
  end
end
