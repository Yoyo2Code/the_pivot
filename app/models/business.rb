class Business < ApplicationRecord
  before_validation :make_slug
  has_many :properties
  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true
  validates :status, presence: true
  validates :user, presence: true, uniqueness: true
  belongs_to :user
  has_many :reservations
  enum status: %w[pending active inactive]

   def self.pending?
     where(status: 'pending')
   end

   def self.active_or_inactive?
     where(status: ['active', 'inactive'])
   end

  private

    def make_slug
      self.slug = name.parameterize if name
    end
end
