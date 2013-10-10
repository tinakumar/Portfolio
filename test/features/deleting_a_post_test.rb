require "test_helper"

feature "DeletingAPost" do
  scenario "deleting a post" do

    #page.must_have_content "Hello World"
    #page.wont_have_content "Goobye All!"
    post = Post.create(title: "Becoming a Code Fellow", content: "Means striving for excellence.")
    visit posts_path(post)
    #select a post to destroy
    page.find("tr:last").click_on "Destroy"
    #click_on "Destroy"

    page.text.must_include 'Post was successfully deleted'
  end
end
