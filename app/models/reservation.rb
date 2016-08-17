class Reservation < ActiveRecord::Base
  validates_presence_of :start_date
  validates_presence_of :end_date
  validates_presence_of :number_of_guests
  validates_presence_of :total_price
  belongs_to :user
  belongs_to :property

  enum status: %w(ordered paid completed cancelled)

end
