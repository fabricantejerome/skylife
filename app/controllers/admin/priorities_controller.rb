class Admin::PrioritiesController < AdminController
  def update
    @category = Category.find_by_id(params[:category_id])
    @new_category = Category.find_by_id(params[:reorderable_target_id])

    if @new_category.present?
      old_priority = @category.priority
      new_priority = @new_category.priority

      if old_priority > new_priority
        categoryList = categories(new_priority..old_priority)
        (0..(categoryList.length - 2)).each do |i|
          first_category = categoryList[i]
          second_category = categoryList[i + 1]
          temp_category_priority = first_category.priority
          first_category.priority = second_category.priority
          second_category.priority = temp_category_priority
        end
        categoryList[categoryList.length - 1].priority = new_priority
        update_categories(categoryList)
      elsif new_priority > old_priority
        categoryList = categories(old_priority..new_priority)
        (categoryList.length - 1).downto(1).each do |i|
          first_category = categoryList[i - 1]
          second_category = categoryList[i]
          temp_category_priority = first_category.priority
          first_category.priority = second_category.priority
          second_category.priority = temp_category_priority
        end
        categoryList[0].priority = new_priority
        update_categories(categoryList)
      end
    end
  end

  private
  def categories(range)
    Category.where(priority: range).order(:priority)
  end

  def update_categories(categoryList)
    categoryDetails = categoryList.map { |category| { id: category.id, priority: category.priority, created_at: category.created_at, updated_at: category.updated_at } }
    Category.upsert_all(categoryDetails)
  end
end
