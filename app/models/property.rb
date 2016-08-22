class Property < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price_per_guest, presence: true
  validates :image_path, presence: true
  validates :max_occupancy, presence: true
  validates :business_id, presence: true
  validates :location_id, presence: true
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  belongs_to :business
  belongs_to :location
  has_many :reservations
  has_many :orders, through: :reservations
  has_many :booked_dates
  has_many :nights, through: :booked_dates

  def bookings
    reservations.map do |r|
      Night.where(
        date: r.starting_date...r.end_date
      ).map{ |d| d.date.strftime('%-m/%-d/%Y') }
    end.flatten
  end
end
