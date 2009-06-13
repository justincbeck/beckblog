require File.dirname(__FILE__) + '/../functional_test_helper'
require 'user_sessions_controller'

class UserSessionsControllerTest < ActionController::TestCase
  setup :activate_authlogic
  
  def test_create_session
    session = create_session
  end

  protected
    def create_session(options = {})
      session = Factory.build(:user, options)
      session.save! if session.valid?
      session
    end
end
