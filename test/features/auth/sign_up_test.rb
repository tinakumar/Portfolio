require "test_helper"

feature "Allows new users to Sign Up" do
  scenario "user is able to sign up" do
    visit root_path
    click_on "Sign Up"

    fill_in "Email", with: "wonder@woman.com"

    fill_in "Password", with: "ironman"
    click_on "Register"

    page.wont_have_content "error!"
  end
end
