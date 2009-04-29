# Created by IntelliJ IDEA.
# User: jbeck
# Date: Apr 6, 2009
# Time: 4:59:49 PM
class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:id])

    if @comment = @post.comments.create(params[:comment])
      flash[:notice] = "Comment Created"
      UserMailer.deliver_comment(@post.subject, @comment.username)
      redirect_to :controller => 'posts', :action => 'index'
    else
      flash[:error] = "Comment Not Created"
      render :action => 'new'
    end
  end
end