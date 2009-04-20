# Created by IntelliJ IDEA.
# User: jbeck
# Date: Apr 6, 2009
# Time: 4:59:02 PM
class PostsController < ApplicationController
  self.append_view_path(File.join(File.dirname(__FILE__), '..', 'views'))

  before_filter :login_required, :only => [ :new, :create ]

  layout 'main'
  def index
    @posts = Post.all
  end

  layout 'main'
  def show
    @posts = Post.all(:order => "created_at DESC", :limit => 5)
    @post = Post.find(params[:id])
  end

  layout 'main'
  def new
    @posts = Post.all(:order => "created_at DESC", :limit => 5)
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