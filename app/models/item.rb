class Item < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image_path, presence: true

  belongs_to :category
end
