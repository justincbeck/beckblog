# Created by IntelliJ IDEA.
# User: jbeck
# Date: Apr 2, 2009
# Time: 8:59:02 PM
class ResumeController < ApplicationController
    layout 'main'
    def index
        @posts = Post.all(:order => "created_at DESC", :limit => 5)
    end
end
