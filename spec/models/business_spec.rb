require 'rails_helper'

RSpec.describe Business, type: :model do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:slug) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:user) }
    it { should belong_to(:user) }
    it { should have_many(:properties) }
    it { should define_enum_for(:status) }
end
