require "test_helper"

feature "VisitingThePostIndex" do
  scenario "with existing posts, show list" do
    Post.create(title: "Becoming a Code Fellow", content: "Means striving for excellence.")
    visit posts_path
    page.must_have_content "Becoming a Code Fellow"
    page.wont_have_content "Goobye All!"
    #see an index of posts
    #be able to view the details of a post
  end
end
