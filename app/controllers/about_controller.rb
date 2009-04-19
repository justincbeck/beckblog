# Created by IntelliJ IDEA.
# User: jbeck
# Date: Apr 19, 2009
# Time: 2:45:02 PM
class AboutController < ApplicationController
    layout 'main'
    def index
        @posts = Post.all
    end
end
