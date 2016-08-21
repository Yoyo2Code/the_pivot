require 'rails_helper'

RSpec.describe "user can see purchase history", type: :feature do
  it "user is logged in" do
    user = create(:user)

    business = create(:business)

    location = create(:location)

    property = create(
      :property,
      location: location,
      business: business
    )

    reservation = build(
      :reservation,
      property: property
    )

    order = build(
    :order
    )

    reservation.order = order

    reservation.save
    order.save

    page.set_rack_session(user_id: user.id)

    visit '/orders'

    save_and_open_page


  end
end
