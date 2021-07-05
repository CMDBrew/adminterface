class Product < ApplicationRecord
  has_one_attached :image

  validates :title, :price, :image_file_name, presence: true

  scope :available, -> { where("available_on < ?", Date.today) }
  scope :drafts, -> { where("available_on > ?", Date.today) }
end
