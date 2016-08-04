require 'rails_helper'

RSpec.describe Category, type: :model do
  context "validations" do
    it { should have_many(:items) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_uniqueness_of(:title) }
  end
end
