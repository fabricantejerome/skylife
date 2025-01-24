class Category < ApplicationRecord
  has_many :tours

  has_one_attached :logo
end
