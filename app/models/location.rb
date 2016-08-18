class Location < ApplicationRecord
  validates :city, presence: true, uniqueness: true

  has_many :properties
end
