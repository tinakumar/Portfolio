require "test_helper"

feature "VisitingThePostIndex" do
  scenario "with existing posts, show list" do
    #click_on "Sign In"
    #fill_in "Email", with: "mister@gmail.com",
    #fill_in "Password", with: "password"
    #Post.create(title: "Becoming a Code Fellow", content: "Means striving for excellence.")
    visit posts_path
    page.text.must_include posts(:ts).title

  end
end
