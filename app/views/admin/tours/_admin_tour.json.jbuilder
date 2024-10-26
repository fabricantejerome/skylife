json.extract! admin_tour, :id, :package, :price_per_head, :name, :location, :promo, :promo_price, :inclusion, :exclusion, :travel_date, :terms_and_condition, :notes, :meta_title, :meta_description, :keywords, :google_analytics_tracking_id, :conversion_tracking_setup, :facebook, :instagram, :tiktok, :category_id, :created_at, :updated_at
json.url admin_tour_url(admin_tour, format: :json)
