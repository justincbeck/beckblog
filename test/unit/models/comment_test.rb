require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def test_create_comment
    assert_difference 'Comment.count' do
      comment = create_comment
      assert !comment.new_record?, "#{comment.errors.full_messages.to_sentence}"
    end
  end

  protected
    def create_comment(options = {})
      comment = Factory.build(:comment, options)
      comment.save! if comment.valid?
      comment
    end
end
