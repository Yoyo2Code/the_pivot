class Night < ApplicationRecord
  has_many :booked_dates
  has_many :properties, through: :booked_dates
end
