require 'rails_helper'

RSpec.describe Business, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:slug) }
    it { should validate_uniqueness_of(:name) }
  end

  context 'associations' do
    it { should have_many(:business_roles) }
    it { should have_many(:roles).through(:business_roles) }
  end
end
