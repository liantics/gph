class ProjectsController < ApplicationController
  def index
   @projects = Project.all
  end

  def new
    @project = Project.new
    @categories = Category.all
  end

  def create
    @project = current_user.projects.create(project_params)

    if @project.save
      redirect_to @project
    else
      redirect_to projects_path
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  private

  def project_params
    params.require(:project).permit(
      :title,
      :blurb,
      :description,
      :category_id,
      :cost,
    )
  end
end
