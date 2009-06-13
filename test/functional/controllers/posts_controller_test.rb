require File.dirname(__FILE__) + '/../functional_test_helper'
require 'posts_controller'

class PostsControllerTest < ActionController::TestCase
  setup :activate_authlogic

  def test_index
    get :index
    assert :success
    assert assigns(:summary_posts)
    assert assigns(:posts)
  end

  def test_show_post
    post = Factory.create(:post, {})
    get :show, :id => post.id
    assert :success
    assert assigns(:summary_posts)
    assert assigns(:post)
  end

  def test_new_post
    create_session(:login => "session_user", :password_salt => salt = Authlogic::Random.hex_token, :crypted_password => Authlogic::CryptoProviders::Sha512.encrypt("justinrocks" + salt), :persistence_token => Authlogic::Random.hex_token)
    get :new
    assert :success
    assert assigns(:post)
  end

  def test_new_post_no_session
    get :new
    assert :success
  end

  def test_list_posts
    create_session(:login => "session_user", :password_salt => salt = Authlogic::Random.hex_token, :crypted_password => Authlogic::CryptoProviders::Sha512.encrypt("justinrocks" + salt), :persistence_token => Authlogic::Random.hex_token)
    Factory.create(:post, {})
    get :list
    assert :success
    assert assigns(:posts)
    assert assigns(:summary_posts)
  end

  def test_edit_post
    create_session(:login => "session_user", :password_salt => salt = Authlogic::Random.hex_token, :crypted_password => Authlogic::CryptoProviders::Sha512.encrypt("justinrocks" + salt), :persistence_token => Authlogic::Random.hex_token)
    new_post = Factory.create(:post, {})
    post :edit, :id => new_post.id
    assert :success
    assert assigns(:post)
    assert assigns(:summary_posts)
  end

  # TODO - Look in to test_update_post further, I think it's wrong!
  def test_update_post
    create_session(:login => "session_user", :password_salt => salt = Authlogic::Random.hex_token, :crypted_password => Authlogic::CryptoProviders::Sha512.encrypt("justinrocks" + salt), :persistence_token => Authlogic::Random.hex_token)
    new_post = Factory.create(:post, {})
    post :update, :id => new_post.id, :params => { :body => "And now I am updating." }
    assert :success
  end

  def test_create_post
    create_session(:login => "session_user", :password_salt => salt = Authlogic::Random.hex_token, :crypted_password => Authlogic::CryptoProviders::Sha512.encrypt("justinrocks" + salt), :persistence_token => Authlogic::Random.hex_token)
    new_post = Factory.attributes_for(:post, {})
    post :create, :post => new_post
    assert :success
    assert_redirected_to :controller => 'posts', :action => 'index'
  end
end
