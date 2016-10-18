module UserSignInHelper
  def login_with_facebook
    visit auth_path(:facebook)
    fill_in :user_name, with: "foobington"
    click_on "Create User"
  end
end
