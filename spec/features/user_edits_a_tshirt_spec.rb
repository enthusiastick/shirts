require "rails_helper"

feature "User edits a t-shirt" do
  context "signed in user" do
    scenario "that they created" do
      login_with_facebook("HeyThereDelilah")
      user = User.find_by(name: "HeyThereDelilah")
      shirt = FactoryGirl.create(:shirt, user: user)
      visit shirt_path(shirt)
      click_link(:edit_shirt)
      fill_in :shirt_name, with: "All That We Needed (Tour Shirt)"
      click_on "Update Shirt"

      expect(page).to have_content("Shirt updated.")
      expect(page).to have_content("All That We Needed (Tour Shirt)")
    end
    scenario "that does not belong to them" do
      shirt = FactoryGirl.create(:shirt)
      login_with_facebook
      visit shirt_path(shirt)

      expect(page).to_not have_content("Edit.")
      expect(page).to have_content("You are not authorized to view this record.")
    end
  end
end
