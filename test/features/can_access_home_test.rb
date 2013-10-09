require "test_helper"

feature "CanAccessHome" do
  scenario "the test is sound" do
    visit root_path
    puts "Here"
    page.must_have_content "Welcome to Tina's Portfolio!"
    page.wont_have_content "Goobye All!"
  end
end
