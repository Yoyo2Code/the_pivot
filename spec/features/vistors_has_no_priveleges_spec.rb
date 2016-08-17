require 'rails_helper'

RSpec.feature "VisitorPrivelegesTest" do
  scenario "visitor cannot view other users data" do
    create(:location) do |location|
      location.items.create(attributes_for(:item))
    end


    visit items_path

    click_on("Add to Cart")
    expect(page).to have_content("Cart Items: 1")

    visit cart_index_path
    expect(page).to have_content "Login or Create Account"
  end

  scenario "visitor cannot view admin pages" do

    visit admin_dashboard_path

    expect(page).to have_content "The page you were looking for doesn't exist."

  end

end
