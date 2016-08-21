class Business < ApplicationRecord
  before_validation :make_slug
  has_many :properties
  has_many :business_roles
  has_many :roles, through: :business_roles
  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true

  private

    def make_slug
      self.slug = name.parameterize if name
    end
end
