require "test_helper"

feature "CreatingAPost" do
  scenario "creating a new post" do
    visit posts_path
    click_on 'New Post'
    fill_in 'Title', with: 'Space, the final frontier'
    fill_in 'Content', with: "These are the adventures of the starship enterprise!"
    click_on 'Create Post'
    page.text.must_include 'Space, the final frontier'
    page.text.must_include 'Post was successfully created'
  end
end
