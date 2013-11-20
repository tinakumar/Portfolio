require "test_helper"

feature "Allows new users to Sign In" do
  scenario "user is able to sign in" do
    visit root_path
    click_on "Sign In"
    fill_in "Email", with: "wonder@woman.com"
    fill_in "Password", with: "ironman"
    click_on "Sign In"

    page.wont_have_content "error!"
  end
end
