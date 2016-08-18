class Reservation < ActiveRecord::Base
  belongs_to :order
  belongs_to :property

  validates :starting_date, presence: true
  validates :end_date, presence: true
  validates :number_of_guests, presence: true
  validates :price, presence: true
end
