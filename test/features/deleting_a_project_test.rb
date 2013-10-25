require "test_helper"

feature "DeletingAProject" do
  scenario "deleting a project" do
    visit projects_path
    page.find("tr:last").click_on "Destroy"
  end
end

