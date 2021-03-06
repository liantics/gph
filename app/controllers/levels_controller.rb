class LevelsController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @level = Level.new
  end

  def create
    project = Project.find(params[:project_id])
    @level = project.levels.build(level_params)
    if @level.save
      redirect_to project
    else
      render :new
    end
  end

  private

  def level_params
    params.require(:level).permit(
      :title,
      :description,
      :amount,
    ).merge(user_id: current_user.id)
  end
end
