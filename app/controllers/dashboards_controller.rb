class DashboardsController < ApplicationController
  def index
    @projects = Project.all
    @category_types = Category.new.generate_active_category_types
    @category_types_count = number_active_category_types
    @column_width = Category.new.generate_widths(
      @category_types_count, existing_columns: 1
    )
  end

  def number_active_category_types
    @category_types.count
  end
end
