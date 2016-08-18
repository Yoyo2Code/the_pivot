class Business < ApplicationRecord
  has_many :properties
  validates :name, presence: true, uniqueness: true
end
