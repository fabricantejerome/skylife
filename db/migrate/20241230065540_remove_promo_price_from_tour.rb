class RemovePromoPriceFromTour < ActiveRecord::Migration[7.1]
  def change
    remove_column :tours, :promo_price, :string
  end
end
