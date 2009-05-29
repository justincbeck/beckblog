require File.dirname(__FILE__) + '/../unit_test_helper'
require 'user_mailer'

class UserMailerTest < Test::Unit::TestCase
  FIXTURES_PATH = File.dirname(__FILE__) + '/../fixtures'
  CHARSET = "utf-8"

  include ActionMailer::Quoting

  def setup
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []

    @expected = TMail::Mail.new
    @expected.set_content_type "text", "plain", { "charset" => CHARSET }
  end

  def test_signup_notification
    user = create_user
    email = UserMailer.deliver_signup_notification(user)
    
    assert !ActionMailer::Base.deliveries.empty? # Test the body of the sent email contains what we expect it to
    assert_equal [user.email], email.to
    assert_equal "www.justibeck.com Please activate your new account", email.subject
    assert_match "http://www.justinbeck.com/activate/#{user.activation_code}", email.body
  end

  def test_activation
    user = create_user
    email = UserMailer.deliver_activation(user)

    assert !ActionMailer::Base.deliveries.empty? # Test the body of the sent email contains what we expect it to
    assert_equal [user.email], email.to
    assert_equal "Your account has been activated!", email.subject
    assert_match "http://www.justinbeck.com/", email.body
  end

  def test_comment
    email = UserMailer.deliver_comment("Subject", "Justin")

    assert !ActionMailer::Base.deliveries.empty? # Test the body of the sent email contains what we expect it to
    assert_equal "New comment on the blog!", email.subject
    assert_match "Justin commented on Subject", email.body
  end

  private
    def read_fixture(action)
      IO.readlines("#{FIXTURES_PATH}/user_mailer/#{action}")
    end

    def encode(subject)
      quoted_printable(subject, CHARSET)
    end

  protected
    def create_user(options = {})
      record = User.new({ :login => 'quire', :email => 'quire@example.com', :password => 'quire69', :password_confirmation => 'quire69' }.merge(options))
      record.register! if record.valid?
      record
    end
  end
