class Business < ApplicationRecord
  before_validation :make_slug
  has_many :properties
  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true
  validates :status, presence: true
  belongs_to :user
  enum status: %w[pending active inactive]

  private

    def make_slug
      self.slug = name.parameterize if name
    end
end
