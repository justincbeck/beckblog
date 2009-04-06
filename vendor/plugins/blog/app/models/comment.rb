# Created by IntelliJ IDEA.
# User: jbeck
# Date: Apr 6, 2009
# Time: 4:41:03 PM

class Comment < ActiveRecord::Base
    belongs_to :post
end