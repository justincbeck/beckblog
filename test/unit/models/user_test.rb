require File.dirname(__FILE__) + '/../unit_test_helper'

class UserTest < ActiveSupport::TestCase

  def test_create_user
    assert_difference 'User.count' do
      user = create_session
      assert !user.new_record?, "#{user.errors.full_messages.to_sentence}"
    end
  end

  def test_create_nil_login
    assert_no_difference 'User.count' do
      user = create_session(:login => nil)
      assert user.errors.on(:login) 
    end
  end

  def test_create_short_login
    assert_no_difference 'User.count' do
      user = create_session(:login => 'short')
      assert user.errors.on(:login)
    end
  end

  def test_create_long_login
    assert_no_difference 'User.count' do
      user = create_session(:login => 'this_login_should_be_too_long')
      assert user.errors.on(:login)
    end
  end

  def test_create_nil_password
    assert_no_difference 'User.count' do
      user = create_session(:password => nil, :password_confirmation => nil)
      assert user.errors.on(:password)
    end
  end

  # TODO: Figure out how to test the validity of the password (length, strength, etc...)
  #def test_create_short_password
  #  assert_no_difference 'User.count' do
  #    user = create_session(:password => 'short', :password_confirmation => 'short')
  #    assert user.errors.on(:password)
  #    assert user.errors.on(:password_confirmation)
  #  end
  #end

  def test_create_passwords_not_match
    assert_no_difference 'User.count' do
      user = create_session(:password => 'something', :password_confirmation => 'something_else')
      assert user.errors.on(:password)
    end
  end

  def test_create_duplicate
    user = create_session(:login => 'duplicate')
    duplicate = create_session(:login => 'duplicate')
    assert duplicate.errors.on(:login)
  end
end
