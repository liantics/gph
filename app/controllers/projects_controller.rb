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
    redirect_to @project
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
