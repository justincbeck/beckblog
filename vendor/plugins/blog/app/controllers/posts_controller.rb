# Created by IntelliJ IDEA.
# User: jbeck
# Date: Apr 6, 2009
# Time: 4:59:02 PM
class PostsController < ApplicationController
  self.append_view_path(File.join(File.dirname(__FILE__), '..', 'views'))

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    if @post = Post.create(params[:post])
      flash[:notice] = "Post Created"
      redirect_to :action => 'index'
    else
      flash[:error] = "Post Not Created"
      render :action => 'new'
    end
  end
  #.... more code
end