require "test_helper"

feature "CheckForBootstrap" do
  scenario "make sure the app has style" do
    visit root_path
    page.must_have_content "Tina"
    page.wont_have_content "Goodbye All!"
  end
end
