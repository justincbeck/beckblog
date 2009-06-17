# Created by IntelliJ IDEA.
# User: jbeck
# Date: Apr 19, 2009
# Time: 2:45:02 PM
class AboutController < ApplicationController
    before_filter :summary_posts, :only => [ :index ]

    layout 'main'

    def index
        @current_user = current_user
    end
end
