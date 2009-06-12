# Created by IntelliJ IDEA.
# User: jbeck
# Date: Apr 6, 2009
# Time: 4:59:02 PM
class PostsController < ApplicationController
  self.append_view_path(File.join(File.dirname(__FILE__), '..', 'views'))

  layout 'main'

  #before_filter :login_required, :only => [ :new, :create, :list, :edit, :update ]
  before_filter :summary_posts, :only => [ :index, :show, :new, :list, :edit ]

  def index
    @posts = Post.find(:all, :conditions => [ "published = ?", true ], :order => "created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def list
    @posts = Post.all
  end

  def edit
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

  private
    def summary_posts
      @summary_posts = Post.find(:all, :conditions => [ "published = ?", true ], :order => "created_at DESC", :limit => 5)
    end
end