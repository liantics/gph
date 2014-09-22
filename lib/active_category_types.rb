module ActiveCategoryTypes
  def generate_active_category_types
    categories = Project.pluck(:category_id).uniq
    Category.where(id: [categories]).pluck(:category_type)
  end
end
