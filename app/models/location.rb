class Location < ApplicationRecord
  validates :city, presence: true, uniqueness: true
  before_validation :make_slug
  validates :slug, presence: true
  has_many :properties

  private

  def make_slug
    self.slug = city.parameterize if city
  end
end
