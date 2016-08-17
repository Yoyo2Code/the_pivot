require 'rails_helper'

RSpec.describe Property, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:price_per_guest) }
    it { is_expected.to validate_presence_of(:image_path) }
    it { is_expected.to validate_uniqueness_of(:title) }
    it { is_expected.to belong_to(:location) }
    it { should have_many(:reservations) }
  end
end
