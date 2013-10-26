require "test_helper"

feature "ApprovingACommentPosts" do
  scenario "approving a comment to an existing post" do
    visit root_path
    click_on "Sign In"
    fill_in "Email", with: "mrs@gmail.com"
    fill_in "Password", with: "hellothere"

    click_on "Sign In"

    visit posts_path
    click_on "Show".first
    click_on "Approve"
    page.text.must_include "Approved"
  end

  feature "ApprovingACommentProjects" do
    scenario "approving a comment to an existing project" do
    visit root_path
    click_on "Sign In"
    fill_in "Email", with: "mrs@gmail.com"
    fill_in "Password", with: "hellothere"

    click_on "Sign In"

    visit projects_path
    click_on "Show".first
    click_on "Approve"
    page.text.must_include "Approved"
    end
  end
end



