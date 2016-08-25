require 'rails_helper'

RSpec.describe Property, type: :model do
  context 'associations' do
    it { should have_many(:booked_dates) }
    it { should have_many(:nights).through(:booked_dates) }
  end
  context "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price_per_guest) }
    it { should validate_presence_of(:image_path) }
    it { should validate_presence_of(:max_occupancy) }
    it { should validate_presence_of(:business_id) }
    it { should validate_presence_of(:location_id) }
    it { should validate_uniqueness_of(:title) }
    it { should belong_to(:location) }
    it { should belong_to(:business) }
    it { should have_many(:reservations) }
    it { should have_many(:orders).through(:reservations) }
    it { should have_many(:booked_dates) }
    it { should have_many(:booked_dates).through(:nights) }
  end
end
