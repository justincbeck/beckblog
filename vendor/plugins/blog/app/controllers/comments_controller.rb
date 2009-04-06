# Created by IntelliJ IDEA.
# User: jbeck
# Date: Apr 6, 2009
# Time: 4:59:49 PM
class CommentsController < ApplicationController
  def index
    @comments = Comment.find_all_by_post_id(params[:post_id])
  end
  #.... more code
end