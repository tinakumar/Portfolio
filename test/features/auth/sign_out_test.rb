require "test_helper"

feature "Allows new users to Sign Up" do
  scenario "user is able to sign up" do
    visit new_user_session_path
    fill_in "Email", with: users(:one).email
    fill_in "Password", with: "password"
    click_on "Sign in"

    click_on "Sign Out"

    page.must_have_content "Success"
    page.must_have_content "Sign Out"
    page.wont_have_content "error!"

    click_on "Sign Out"

    page.must_have_content "Signed out successfully"

  end
end




