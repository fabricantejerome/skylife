class Tour < ApplicationRecord
  belongs_to :category

  has_one_attached :featured_image

  has_many_attached :gallery_images
end
