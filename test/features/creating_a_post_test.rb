require "test_helper"

feature "CreatingAPost" do
  scenario "creating a new post" do
    sign_in
    visit new_post_path
    fill_in 'Title', with: posts(:ta).title
    fill_in 'Content', with: posts(:ta).content
    click_on 'Create Post'
    page.text.must_include posts(:ta).title
    page.text.must_include 'Post was successfully created'

  end
end


