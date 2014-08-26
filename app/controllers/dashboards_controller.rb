class DashboardsController < ApplicationController
  def index
    @your_projects = user_project_list
    @projects_you_funded = user_donated_list
  end

  private

  def user_project_list
    if current_user
      Project.where(user_id: current_user.id)
    end
  end

  def user_donated_list
    if current_user
      Project.joins(:donations).where(donations: [user_id: current_user.id])
    end
  end
end
