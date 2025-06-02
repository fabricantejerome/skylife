class AddExternalLinkToTours < ActiveRecord::Migration[7.1]
  def change
    add_column :tours, :external_link, :string
  end
end
