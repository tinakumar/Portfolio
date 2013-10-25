require "test_helper"

feature "CreatingAComment" do
  scenario "adding a comment to an existing post" do
    visit root_path
    click_on "Sign In"
    fill_in "Email", with: "wonder@woman.com"
    fill_in "Password", with: "ironman"

    click_on "Sign In"

    visit new_post_comment_path
    fill_in 'Content', with: "Waiting for the weekend!"
    click_on 'Create Comment'
    page.text.must_include "Waiting"
    page.text.must_include 'Comment is pending approval'

  end
end
