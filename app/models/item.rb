class Item < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image_path, presence: true

  belongs_to :category
  has_many :order_items
  has_many :orders, through: :order_items

  enum status: %w(active retired)
end
