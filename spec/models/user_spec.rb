require 'rails_helper'

RSpec.describe User, "associations", type: :model do
  it { should have_many(:orders) }
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_uniqueness_of(:username) }
end
