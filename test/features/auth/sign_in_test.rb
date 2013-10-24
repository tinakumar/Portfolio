require "test_helper"

feature "Allows new users to Sign Up" do
  scenario "user is able to sign up" do
    visit root_path
    click_on "Sign In"
    fill_in "Email", with: "wonder@woman.com"
    fill_in "Password", with: "ironman"
    fill_in "Password confirmation", with: "ironman"
    click_on "Sign In"

    page.wont_have_content "error!"
  end

   scenario "sign in with twitter works" do
   visit root_path
   click_on "Sign In"
   OmniAuth.config.test_mode = true
   Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
   Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
   OmniAuth.config.add_mock(:twitter,
                            {
                            uid: '12345',
                            info: { nickname: 'test_twitter_user'},
                            })
   click_on "Sign in with Twitter"
   save_and_open_page
   page.must_have_content "test_twitter_user, you are signed in!"
  end
end
