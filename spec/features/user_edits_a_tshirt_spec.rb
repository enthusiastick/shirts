require "rails_helper"

feature "User edits a t-shirt" do
  let(:shirt) { create :shirt }
  scenario "that does not belong to them" do
    login_with_facebook
    visit shirt_path(shirt)

    expect(page).to_not have_content("Edit.")
    expect(page).to have_content("You are not authorized to view this record.")
  end
end
