require File.dirname(__FILE__) + '/../test_helper'

class LoginTest < ActionController::IntegrationTest
  fixtures :all

  def test_login
    visit '/login'
    fill_in 'login', :with => 'quentin'
    fill_in 'password', :with => 'monkey'
    click_button "Login"
    assert_contain "Log out"
  end
  # TODO: Implement other integration tests 

  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
