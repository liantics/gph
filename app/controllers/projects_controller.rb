class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
    @categories = Category.all
  end

  def create
    project = current_user.projects.create(project_params)
    if project.save
      redirect_to project
    else
      redirect_to projects_path
    end
  end

  def show
    @project = Project.find(params[:id])
    @new_level = Level.new
    @donation = Donation.new
    @levels = @project.sorted_donation_levels
    @percentage = @project.percentage_of_goal
    @percent_header_text = @project.percent_header_text
  end

  def index
    @projects = Project.all
  end

  def edit
    @project = Project.find(params[:id])
    @categories = Category.all
  end

  def update
    project = current_user.projects.find(params[:id])
    if current_user.allowed_to_modify?(project)
      update_project(project)
    else
      redirect_to projects_path
    end
  end

  private

  def project_params
    params.require(:project).permit(
      :title,
      :blurb,
      :description,
      :category_id,
      :cost,
      :image,
    )
  end

  def update_project(project)
    if project.update(project_params)
      redirect_to project
    else
      render :edit
    end
  end
end
