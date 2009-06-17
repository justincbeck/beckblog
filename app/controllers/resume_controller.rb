# Created by IntelliJ IDEA.
# User: jbeck
# Date: Apr 2, 2009
# Time: 8:59:02 PM
class ResumeController < ApplicationController
    before_filter :summary_posts, :only => [ :index ]

    layout 'main'

    def index
        @current_user = current_user
    end
end
