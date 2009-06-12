# Created by IntelliJ IDEA.
# User: jbeck
# Date: Apr 19, 2009
# Time: 2:45:02 PM
class AboutController < ApplicationController
    layout 'main'

    def index
        @current_user = current_user
        @summary_posts = Post.find(:all, :conditions => [ "published = ?", true ], :order => "created_at DESC", :limit => 5)
    end
end
