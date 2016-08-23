require 'rails_helper'

RSpec.describe Night, type: :model do
  context 'associations' do
    it { should have_many(:booked_dates) }
    it { should have_many(:properties).through(:booked_dates) }
  end
end
