require "rails_helper"

feature "User adds a t-shirt" do
  context "signed in user" do
    scenario "filling in nothing" do
      login_with_facebook("DaveTirio")
      visit new_shirt_path
      click_on "Create Shirt"

      expect(page).to have_content("There was a problem creating this shirt.")
    end
    scenario "with only a name" do
      login_with_facebook("Higgenson")
      user = User.find_by(name: "Higgenson")
      visit new_shirt_path
      fill_in :shirt_name, with: "Plain White T"
      click_on "Create Shirt"

      expect(page).to have_content("Shirt created.")
      expect(page).to have_content("Plain White T")
      shirt = Shirt.find_by(name: "Plain White T")
      expect(shirt.user).to eq(user)
    end
  end
  context "unauthorized user" do
    scenario "tries to create a shirt" do
      visit new_shirt_path

      expect(page).to have_content("You need to sign in before continuing.")
      expect(page).to_not have_css("form #new_shirt")
    end
  end
end
