require 'rails_helper'

RSpec.describe Reservation, "associations", type: :model do
  it { should belong_to(:property) }
  it { should belong_to(:user) }
  it { is_expected.to validate_presence_of(:start_date) }
  it { is_expected.to validate_presence_of(:end_date) }
  it { is_expected.to validate_presence_of(:number_of_guests) }
  it { is_expected.to validate_presence_of(:total_price) }
end
