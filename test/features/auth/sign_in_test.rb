require "test_helper"

feature "Allows new users to Sign Up" do
  scenario "user is able to sign up" do
    visit root_path
    click_on "Sign In"
    fill_in "Email", with: "wonder@woman.com"
    fill_in "Password", with: "ironman"
    fill_in "Password confirmation", with: "ironman"
    click_on "Sign In"

    page.wont_have_content "error!"
  end
end
