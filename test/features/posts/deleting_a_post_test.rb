require "test_helper"

feature "DeletingAPost" do
  scenario "deleting a post" do


    visit posts_path#posts_path(post)

    page.find("tr:last").click_on "Destroy"


    page.wont_have_content 'Rainbows'
  end
end
