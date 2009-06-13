require File.dirname(__FILE__) + '/../functional_test_helper'
require 'user_sessions_controller'

class UserSessionsControllerTest < ActionController::TestCase
  setup :activate_authlogic
  
  def test_create_session
    session = create_session
    post :create, :user_session => session
    assert_redirected_to '/account'
  end

  def test_create_invalid_session
    post :create, :user_session => 'invalid'
    assert_routing( '/login', :controller => 'user_sessions', :action => 'new' )
  end

  def test_destroy_session
    session = create_session
    post :create, :user_session => session
    get :destroy
    assert_redirected_to '/'
  end
end
