require File.dirname(__FILE__) + '/../functional_test_helper'
require 'comments_controller'

class CommentsControllerTest < ActionController::TestCase
  setup :activate_authlogic

  def test_create_comment
    create_session(:login => "session_user", :password_salt => salt = Authlogic::Random.hex_token, :crypted_password => Authlogic::CryptoProviders::Sha512.encrypt("justinrocks" + salt), :persistence_token => Authlogic::Random.hex_token)
    new_post = Factory.create(:post, {})
    post :create, :id => new_post.id, :params => { :username => 'stanley', :body => 'Here is a comment' }
    assert :success
    assert_redirected_to :controller => 'posts', :action => 'index'
  end
end
