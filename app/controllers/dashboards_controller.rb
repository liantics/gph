class DashboardsController < ApplicationController
  EXISTING_COLUMNS_IN_ROW = 1
  TOTAL_COLUMNS_IN_GRID = 12
  MIN_COL_WIDTH = 3
  MAX_COL_WIDTH = 12

  def index
    @projects = Project.all
    @category_types = active_category_types(@projects)
    @category_types_count = number_active_category_types
    @column_width = automatic_column_widths
  end

  def active_category_types(projects)
    generate_active_category_types(projects)
  end

  def number_active_category_types
    @category_types.count
  end

  def automatic_column_widths
    generate_column_widths
  end

  private

  def generate_active_category_types(projects)
    type_list = Array.new

    projects.each do |project|
      type_list << project.type
    end

    type_list.uniq
  end

  def generate_column_widths
    columns_in_row = number_active_category_types + EXISTING_COLUMNS_IN_ROW
    width = (TOTAL_COLUMNS_IN_GRID/columns_in_row).floor

    if width < MIN_COL_WIDTH
      width = MIN_COL_WIDTH
    elsif width > MAX_COL_WIDTH
      width = MAX_COL_WIDTH
    end

    width
  end
end
