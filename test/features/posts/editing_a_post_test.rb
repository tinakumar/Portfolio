require "test_helper"

feature "EditingAPost" do
  scenario "submit updates to an existing post" do

    sign_in_user

    visit post_path(:ta)
    click_on 'Edit'
    #fill_in form with updated info
    fill_in 'Title', with: 'Khan was amazing'
    click_on 'Update Post'

    page.text.must_include 'Khan'
    page.text.must_include 'Post was successfully updated'
  end
end
