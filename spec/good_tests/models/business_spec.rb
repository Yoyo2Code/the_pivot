require 'rails_helper'

RSpec.describe Business, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:slug) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:status) }
  end

  context 'enum' do
    it { should define_enum_for(:status) }
  end
end
