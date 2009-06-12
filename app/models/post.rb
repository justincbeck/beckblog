# Created by IntelliJ IDEA.
# User: jbeck
# Date: Apr 6, 2009
# Time: 4:40:22 PM
class Post < ActiveRecord::Base
    has_many :comments, :order => 'created_at DESC'
    belongs_to :user

    # TODO: Figure out what the hell this does
#    def comment_count; self.comments.count; end
#
#    def to_xml(opts={})
#        super(opts.merge(:include => [:posts], :methods => [:comment_count]))
#    end
end