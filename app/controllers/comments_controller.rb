# Created by IntelliJ IDEA.
# User: jbeck
# Date: Apr 6, 2009
# Time: 4:59:49 PM
class CommentsController < ApplicationController
  before_filter :get_post

  def create
    @post.comments.create(params[:comment])
    redirect_to :controller => 'posts', :action => 'index'
  end

  private
    def get_post
      @post = Post.find(params[:id])
    end
end