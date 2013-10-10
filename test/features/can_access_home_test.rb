require "test_helper"

feature "CanAccessHome" do
  scenario "can access the home page" do
    visit root_path
    puts "Here"
    page.must_have_content "Welcome to Tina's Portfolio!"
    page.wont_have_content "Goodbye All!"
  end
end
