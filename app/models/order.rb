class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  enum status: %w(ordered paid completed cancelled)

end
