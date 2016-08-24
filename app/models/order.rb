class Order < ActiveRecord::Base
  belongs_to :user
  has_many :reservations
  has_many :properties, through: :reservations

  enum status: %w(ordered paid completed cancelled)
end
