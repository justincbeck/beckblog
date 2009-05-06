# Created by IntelliJ IDEA.
# User: jbeck
# Date: Apr 6, 2009
# Time: 4:59:49 PM
class CommentsController < ApplicationController
  before_filter :get_post

  def create
    if @comment = @post.comments.create(params[:comment])
      flash[:notice] = "Comment Created"
      UserMailer.deliver_comment(@post.subject, @comment.username)
      redirect_to :controller => 'posts', :action => 'index'
    else
      flash[:error] = "Comment Not Created"
      render :action => 'new'
    end
  end

  private
    def get_post
      @post = Post.find(params[:id])
    end
end