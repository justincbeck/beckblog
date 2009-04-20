# Created by IntelliJ IDEA.
# User: jbeck
# Date: Apr 6, 2009
# Time: 4:59:49 PM
class CommentsController < ApplicationController
  layout 'main'
  def index
    @posts = Post.all(:order => "created_at DESC", :limit => 5)
    @comments = Comment.find_all_by_post_id(params[:post_id])
  end

  layout 'main'
  def new
    @posts = Post.all(:order => "created_at DESC", :limit => 5)
    @comment = Comment.new
  end

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