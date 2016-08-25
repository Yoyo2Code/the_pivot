class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :role, presence: true

  has_secure_password

  has_one :business
  has_many :orders

  enum role: %w(default business_admin platform_admin)
end
