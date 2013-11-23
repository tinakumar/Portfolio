require "test_helper"

feature "CreatingAProject", js: true do
  scenario "adding a new project to the portfolio" do
    visit new_project_path

    fill_in 'Name', with: "Tryzee"
    fill_in 'Description', with: "Fun"
    click_on 'Create Project'
    page.text.must_include 'Tryzee'

  end
end
