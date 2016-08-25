require 'rails_helper'

RSpec.describe User, "associations", type: :model do
  it { should have_many(:orders) }
  it { should validate_presence_of(:role) }
  it { should define_enum_for(:role) }
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:password) }
  it { should have_many(:orders) }
  it { should have_one(:business) }
end
