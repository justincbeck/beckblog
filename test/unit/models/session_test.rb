require File.dirname(__FILE__) + '/../unit_test_helper'

class SessionTest < ActiveSupport::TestCase
  setup :activate_authlogic

  def test_create_session
    session = create_session(:login => "session_user", :password_salt => salt = Authlogic::Random.hex_token, :crypted_password => Authlogic::CryptoProviders::Sha512.encrypt("justinrocks" + salt), :persistence_token => Authlogic::Random.hex_token)
    assert !session.new_record?, "#{session.errors.full_messages.to_sentence}"
  end
end
