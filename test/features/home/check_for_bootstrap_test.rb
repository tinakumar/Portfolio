require "test_helper"

feature "CheckForBootstrap" do
  scenario "make sure the app has style" do
    visit root_path
    page.body.must_match /col-/
  end
end

