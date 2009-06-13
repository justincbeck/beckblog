require File.dirname(__FILE__) + '/../functional_test_helper'
require 'users_controller'

class UsersControllerTest < ActionController::TestCase
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

  def test_show_user
    get :show
    assert :success
    assert_not_nil :user
  end

  def test_edit_user
    get :edit
    assert :success
    assert_not_nil :user
  end

  def test_list_users
    Factory.create(:user, {})
    Factory.create(:user, {})
    get :list
    assert :success
    assert_not_nil :users
  end
end
