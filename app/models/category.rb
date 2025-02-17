class Category < ApplicationRecord
  after_create :set_priority
  has_many :tours

  has_one_attached :logo

  def set_priority
    self.priority = self.id
    self.save
  end
end
