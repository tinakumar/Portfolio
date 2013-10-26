require "test_helper"

feature "EditingAPost" do
  scenario "submit updates to an existing post" do

    #page.must_have_content "Hello World"
    #page.wont_have_content "Goobye All!"
    #should see index of posts
    #choose post select edit
    post = Post.create(title: "Code Fellows Rocks", content: "Creating future stars.")
    visit post_path(post)
    click_on 'Edit'
    #fill_in form with updated info
    fill_in 'Title', with: 'Khan was amazing'
    click_on 'Update Post'
    #should see updated text
    page.text.must_include 'Khan was amazing'
    page.text.must_include 'Post was successfully updated'
  end
end
