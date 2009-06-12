require File.dirname(__FILE__) + '/../test_helper'

class LoginTest < ActionController::IntegrationTest
  def test_login
    user = create_user
    visit '/login'
    fill_in 'login', :with => user.login
    fill_in 'password', :with => user.password
    click_button "Login"
    assert_contain "Log out"
  end
  # TODO: Implement other integration tests 

  protected
    def create_user(options = {})
      user = Factory.build(:user, options)
      user.save! if user.valid?
      user
    end
end
