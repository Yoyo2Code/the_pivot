require 'rails_helper'

RSpec.describe User, "associations", type: :model do
  it { should have_many(:orders) }
  it { is_expected.to validate_presence_of(:role) }
  it { is_expected.to define_enum_for(:role) }
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_uniqueness_of(:username) }
end
