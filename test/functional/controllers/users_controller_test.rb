require File.dirname(__FILE__) + '/../functional_test_helper'
require 'users_controller'

class UsersControllerTest < ActionController::TestCase
  setup :activate_authlogic
  
  def test_new_user
    get :new
    assert :success
    assert_not_nil :user
    assert assigns(:user)
  end

  def test_create_user
    new_user = Factory.attributes_for(:user, {})
    post :create, :user => new_user
    assert :success
    assert assigns(:user)
    assert_redirected_to "/account"
  end

  def test_create_invalid_user
    new_user = Factory.attributes_for(:user, { :login => nil })
    post :create, :user => new_user
    assert :failure
    assert assigns(:user)
    assert :success
  end

  def test_show_user
    session = create_session(:login => "session_user", :password_salt => salt = Authlogic::Random.hex_token, :crypted_password => Authlogic::CryptoProviders::Sha512.encrypt("justinrocks" + salt), :persistence_token => Authlogic::Random.hex_token)
    get :show
    assert :success
    assert assigns(:user)
  end

  def test_edit_user
    session = create_session(:login => "session_user", :password_salt => salt = Authlogic::Random.hex_token, :crypted_password => Authlogic::CryptoProviders::Sha512.encrypt("justinrocks" + salt), :persistence_token => Authlogic::Random.hex_token)
    get :edit
    assert :success
    assert assigns(:user)
  end

  def test_update_user
    session = create_session(:login => "session_user", :password_salt => salt = Authlogic::Random.hex_token, :crypted_password => Authlogic::CryptoProviders::Sha512.encrypt("justinrocks" + salt), :persistence_token => Authlogic::Random.hex_token)
    new_user = Factory.attributes_for(:user, {})
    post :update, :user => new_user 
    assert_redirected_to '/account'
  end

  def test_update_invalid_user
    session = create_session(:login => "session_user", :password_salt => salt = Authlogic::Random.hex_token, :crypted_password => Authlogic::CryptoProviders::Sha512.encrypt("justinrocks" + salt), :persistence_token => Authlogic::Random.hex_token)
    new_user = Factory.attributes_for(:user, { :password => 'something', :password_confirmation => 'something_else' })
    post :update, :user => new_user
    assert :failure
    assert assigns(:user)
    assert :success
  end

  def test_list_users
    session = create_session(:login => "session_user", :password_salt => salt = Authlogic::Random.hex_token, :crypted_password => Authlogic::CryptoProviders::Sha512.encrypt("justinrocks" + salt), :persistence_token => Authlogic::Random.hex_token)
    Factory.create(:user, {})
    Factory.create(:user, {})
    get :list
    assert :success
    assert assigns(:users)
  end
end
