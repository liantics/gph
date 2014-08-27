class SuccessStoriesController < ApplicationController
  def index
    projects = Project.all
    @success_stories = generate_success_list(projects)
  end

  private

  def generate_success_list(projects)
    success_list = []
    projects.each do |project|
      if project.successful?
        success_list << project
      end
    end
    success_list
  end
end
