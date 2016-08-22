class Role < ApplicationRecord
  has_many :business_roles
  has_many :businesses, through: :business_roles
  validates :name, presence: true
end
