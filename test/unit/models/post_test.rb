require File.dirname(__FILE__) + '/../unit_test_helper'

class PostTest < ActiveSupport::TestCase

  def test_create_post
    assert_difference 'Post.count' do
      post = create_post
      assert !post.new_record?, "#{post.errors.full_messages.to_sentence}"
    end
  end

  protected
    def create_post(options = {})
      post = Factory.build(:post, options)
      post.save! if post.valid?
      post
    end
end
