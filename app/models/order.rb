class Order < ActiveRecord::Base
  belongs_to :user
  has_many :reservations
  has_many :properties, through: :reservations

  enum status: %w(ordered paid completed cancelled)

  def order_data
    self.status
    self.reservations
  end

  private

  def reservation_data
    self.reservations.map do |reservation|
      reservation
    end
  end
end
