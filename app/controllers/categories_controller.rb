class CategoriesController < ApplicationController
  def new
    @category = Category.new 
  end

  def create
    @category = current_user.categories.new(category_params.merge(user_id: current_user.id))
    if @category.save
      redirect_to @category 
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
    @category = Category.find(params[:id])
    if current_user.allowed_to_modify?(@category)
      if @category.update(category_params)
        redirect_to @category
      else
        render :edit
      end

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
end
