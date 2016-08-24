class Night < ApplicationRecord
  has_many :booked_dates
  has_many :properties, through: :booked_dates

  def formatted_time
    date.strftime('%Y-%m-%d')
  end
end
