require 'rails_helper'

RSpec.describe Reservation, type: :model do
  context "associations" do
    it { should belong_to(:order) }
    it { should belong_to(:property) }
    it { should validate_presence_of(:starting_date) }
    it { should validate_presence_of(:end_date) }
    it { should validate_presence_of(:number_of_guests) }
    it { should validate_presence_of(:price) }
  end
end
