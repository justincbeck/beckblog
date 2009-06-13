# Created by IntelliJ IDEA.
# User: jbeck
# Date: Apr 6, 2009
# Time: 4:40:22 PM
class Post < ActiveRecord::Base
  has_many :comments, :order => 'created_at DESC'
  belongs_to :user

  validates_presence_of :subject
  validates_presence_of :body
end