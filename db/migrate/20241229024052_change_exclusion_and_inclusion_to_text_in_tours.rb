class ChangeExclusionAndInclusionToTextInTours < ActiveRecord::Migration[7.1]
  def change
    change_column :tours, :exclusion, :text
    change_column :tours, :inclusion, :text
  end
end
