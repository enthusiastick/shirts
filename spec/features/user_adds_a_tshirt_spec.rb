require "rails_helper"

feature "User adds a t-shirt" do
  scenario "with only a name" do
    login_with_facebook
    visit new_shirt_path
    fill_in :shirt_name, with: "Plain White Tee"
    click_on "Create Shirt"

    expect(page).to have_content("Shirt created.")
    expect(page).to have_content("Plain White Tee")
  end
end
