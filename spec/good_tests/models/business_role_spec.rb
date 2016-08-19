require 'rails_helper'

RSpec.describe BusinessRole, type: :model do
  context 'associations' do
    it { should belong_to(:business) }
    it { should belong_to(:role) }
  end
end
