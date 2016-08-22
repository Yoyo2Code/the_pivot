require 'rails_helper'

RSpec.describe Role, type: :model do
  context 'associations' do
    it { should have_many(:business_roles) }
    it { should have_many(:businesses).through(:business_roles) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
  end
end
