require 'rails_helper'

RSpec.describe Order, type: :model do
    it { should belong_to(:user) }
    it { should have_many(:reservations) }
    it { should have_many(:properties).through(:reservations) }
    it { should define_enum_for(:status) }
end
