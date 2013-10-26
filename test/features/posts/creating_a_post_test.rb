require "test_helper"

feature "CreatingAPost" do
  scenario "creating a new post" do
    visit root_path
    click_on "Sign In"
    fill_in "Email", with: "wonder@woman.com"
    fill_in "Password", with: "ironman"
    click_on "Sign In"
    visit new_post_path
    fill_in 'Title', with: posts(:ta).title
    fill_in 'Content', with: posts(:ta).content
    click_on 'Create Post'
    page.text.must_include posts(:ta).title
    page.text.must_include 'Post was successfully created'

  end
end


