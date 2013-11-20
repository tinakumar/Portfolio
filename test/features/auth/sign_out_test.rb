require "test_helper"

feature "Allows users to sign out" do
  scenario "user is able to sign out" do
    visit new_user_session_path
    fill_in "Email", with: "mister@gmail.com"
    fill_in "Password", with: "password"
    click_on "Sign in"

    click_on "Sign Out"

    page.must_have_content "Success"
    page.must_have_content "Sign Out"
    page.wont_have_content "error!"

  end
end




