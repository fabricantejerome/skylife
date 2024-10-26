class CreateAdminTours < ActiveRecord::Migration[7.1]
  def change
    create_table :tours do |t|
      t.string :package
      t.string :price_per_head
      t.string :name
      t.string :location
      t.string :promo
      t.string :promo_price
      t.string :inclusion
      t.string :exclusion
      t.string :travel_date
      t.text :terms_and_condition
      t.string :notes
      t.string :meta_title
      t.string :meta_description
      t.string :keywords
      t.string :google_analytics_tracking_id
      t.string :conversion_tracking_setup
      t.string :facebook
      t.string :instagram
      t.string :tiktok
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
