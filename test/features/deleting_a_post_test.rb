require "test_helper"

feature "DeletingAPost" do
  scenario "deleting a post" do

    #page.must_have_content "Hello World"
    #page.wont_have_content "Goobye All!"
    post = Post.create(posts(:ta).title, posts(:ta).content)
    visit posts_path#posts_path(post)
    #select a post to destroy
    page.find(posts(:ta).title)#.click_on "Destroy"
    click_on "Destroy"

    page.text.must_include 'Post was successfully deleted'
  end
end
