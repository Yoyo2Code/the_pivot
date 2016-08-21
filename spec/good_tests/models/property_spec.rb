require 'rails_helper'

RSpec.describe Property, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:price_per_guest) }
    it { is_expected.to validate_presence_of(:image_path) }
    it { is_expected.to validate_presence_of(:max_occupancy) }
    it { is_expected.to validate_presence_of(:business_id) }
    it { is_expected.to validate_presence_of(:location_id) }
    it { is_expected.to validate_uniqueness_of(:title) }
    it { is_expected.to belong_to(:location) }
    it { is_expected.to belong_to(:business) }
    it { should have_many(:reservations) }
    it { should have_many(:orders).through(:reservations) }
  end
end
