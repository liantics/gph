class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.new(category_params)

    if @category.save
      redirect_to @category
    else
      render :new
    end
  end

  def index
    if current_user.site_admin
      @categories = Category.all
      @category_types = Category.new.generate_active_category_types
      @column_width = Category.new.generate_widths(@category_types.count)
    else
      redirect_to root_path
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    category = Category.find(params[:id])

    if current_user.allowed_to_modify?(category)
      update_category(category)
    else
      redirect_to root_path
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name,
      :category_type,
    )
  end

  def update_category(category)
    if category.update(category_params)
      redirect_to category
    else
      render :edit
    end
  end
end
