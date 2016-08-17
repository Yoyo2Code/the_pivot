require 'rails_helper'

RSpec.describe Location, type: :model do
  context "validations" do
    it { should have_many(:properties) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_uniqueness_of(:city) }
  end
end
