# Created by IntelliJ IDEA.
# User: jbeck
# Date: Apr 6, 2009
# Time: 4:41:03 PM

class Comment < ActiveRecord::Base
  belongs_to :post

  validates_presence_of :username
  validates_presence_of :body
  validates_format_of :email, :allow_nil => true, :allow_blank => true, :with => %r{^(?:[_a-z0-9-]+)(\.[_a-z0-9-]+)*@([a-z0-9-]+)(\.[a-zA-Z0-9\-\.]+)*(\.[a-z]{2,4})$}i
end