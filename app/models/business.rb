class Business < ApplicationRecord
  before_validation :make_slug
  has_many :properties
  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true

  private

  def make_slug
    self.slug = name.parameterize
  end
end
