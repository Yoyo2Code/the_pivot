require 'rails_helper'

RSpec.describe BookedDate, type: :model do
  context 'associations' do
    it { should belong_to(:property) }
    it { should belong_to(:night) }
  end
end
