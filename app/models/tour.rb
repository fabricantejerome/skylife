class Tour < ApplicationRecord
  belongs_to :category

  has_one_attached :featured_image

  has_one_attached :banner_image

  has_many_attached :gallery_images

  scope :home_flash_sale, -> { where(:category_id => 1).order(:created_at => :desc).limit(3) }
  scope :home_new_packages, -> { order(:created_at => :desc).limit(3) }
  scope :new_packages, -> { order(:created_at => :desc) }
end
