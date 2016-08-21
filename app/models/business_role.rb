class BusinessRole < ApplicationRecord
  belongs_to :role
  belongs_to :business
end
