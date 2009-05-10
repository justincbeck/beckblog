require 'test_helper'

class AboutControllerTest < ActionController::TestCase
  def test_index
    @summary_posts = get :index
    assert_not_nil @summary_posts
#    assert @summary_posts.length >= 0
#    assert @summary_posts.size >= 0
  end
end
