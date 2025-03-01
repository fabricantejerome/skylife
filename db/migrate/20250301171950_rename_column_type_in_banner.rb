class RenameColumnTypeInBanner < ActiveRecord::Migration[7.1]
  def change
    rename_column :banners, :type, :attachment_type
  end
end
