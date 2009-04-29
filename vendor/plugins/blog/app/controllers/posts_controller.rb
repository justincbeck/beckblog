# Created by IntelliJ IDEA.
# User: jbeck
# Date: Apr 6, 2009
# Time: 4:59:02 PM
class PostsController < ApplicationController
  self.append_view_path(File.join(File.dirname(__FILE__), '..', 'views'))

  before_filter :login_required, :only => [ :new, :create, :list, :edit, :update ]

  layout 'main'
  def index
    @posts = Post.all(:order => "created_at DESC");
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

  layout 'main'
  def list
      @posts = Post.all
  end

  layout 'main'
  def edit
      @posts = Post.all(:order => "created_at DESC", :limit => 5)
      @post = Post.find(params[:id])
  end

  def update
      Post.update(params[:id], params[:post])
      redirect_to :action => 'list'
  end

  def create
    @user = User.all([ "login = ?", current_user ])[0]

    if @post = @user.posts.create(params[:post])
      flash[:notice] = "Post Created"
      redirect_to :action => 'index'
    else
      flash[:error] = "Post Not Created"
      render :action => 'new'
    end
  end
end