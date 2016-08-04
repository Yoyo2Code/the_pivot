require 'rails_helper'

RSpec.describe Order, "associations", type: :model do
  it { should have_many(:order_items) }
  it { should have_many(:items).through(:order_items) }
    it { is_expected.to belong_to(:user) }
end
