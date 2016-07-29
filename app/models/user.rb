class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  has_secure_password

  has_many :orders

  enum role: %w(default admin)
end
