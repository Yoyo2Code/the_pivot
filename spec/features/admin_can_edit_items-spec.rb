require 'rails_helper'

RSpec.feature "admin can edit an item" do
  scenario "admin edits an item" do

    admin = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    # As an admin

  end
end
