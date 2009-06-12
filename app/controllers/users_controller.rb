class UsersController < ApplicationController
  before_filter :require_user, :only => [:show, :edit, :list, :update, :new, :create]
  before_filter :summary_posts, :only => [ :show, :new, :list, :edit ]
  
  layout 'main'

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Account registered!"
      redirect_back_or_default account_url
    else
      render :action => :new
    end
  end

  def show
    @user = @current_user
  end

  def list
    @users = User.all
  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end

  private
    def summary_posts
      @summary_posts = Post.find(:all, :conditions => [ "published = ?", true ], :order => "created_at DESC", :limit => 5)
    end
end
