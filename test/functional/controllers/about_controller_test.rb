require File.dirname(__FILE__) + '/../functional_test_helper'
require 'about_controller'

class AboutControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert :success
  end
end
