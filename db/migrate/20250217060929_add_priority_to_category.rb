class AddPriorityToCategory < ActiveRecord::Migration[7.1]
  def change
    add_column :categories, :priority, :integer
  end
end
