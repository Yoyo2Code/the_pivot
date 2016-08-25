class Reservation < ActiveRecord::Base
  belongs_to :order
  belongs_to :property

  validates :starting_date, presence: true, uniqueness: { scope: :property_id }
  validates :end_date, presence: true, uniqueness: { scope: :property_id }
  validates :number_of_guests, presence: true
  validates :price, presence: true
end
