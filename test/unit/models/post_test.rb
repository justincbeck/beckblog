require File.dirname(__FILE__) + '/../unit_test_helper'

class PostTest < ActiveSupport::TestCase

  def test_create_post
    assert_difference 'Post.count' do
      post = create_post
      assert !post.new_record?, "#{post.errors.full_messages.to_sentence}"
    end
  end

  def test_create_nil_subject_post
    post = create_post( :subject => nil )
    assert post.new_record?, "#{post.errors.full_messages.to_sentence}"
  end

  def test_create_nil_body_post
    post = create_post( :body => nil )
    assert post.new_record?, "#{post.errors.full_messages.to_sentence}"
  end

  def test_create_nil_subject_nil_body_post
    post = create_post( :subject => nil, :body => nil )
    assert post.new_record?, "#{post.errors.full_messages.to_sentence}"
  end

  protected
    def create_post(options = {})
      post = Factory.build(:post, options)
      post.save! if post.valid?
      post
    end
end
