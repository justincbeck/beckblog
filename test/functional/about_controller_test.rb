require 'test_helper'

class AboutControllerTest < ActionController::TestCase
  def test_index
    assert get :index
  end
end
