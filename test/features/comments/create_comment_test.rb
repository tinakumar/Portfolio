require "test_helper"

feature "CreatingAComment" do
  scenario "adding a comment to an existing post" do
    sign_in
    visit new_comment_path
    fill_in 'Content', with: "Waiting for the weekend!"
    click_on 'Create Comment'
    page.text.must_include "Waiting"
    page.text.must_include 'Comment was successfully created'

  end
end
