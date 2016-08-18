class Location < ApplicationRecord
  before_validation :make_slug
  validates :slug, presence: true
  validates :city, presence: true, uniqueness: true
  has_many :properties

  private

  def make_slug
    self.slug = city.parameterize
  end
end
