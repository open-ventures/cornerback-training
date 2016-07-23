class Admin::UsersController < ApplicationController

  before_filter :authenticate_admin!
  layout "admin"

  def index
    @users = User.page(params[:page]).per(20).order("stripe_id DESC")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to action: :index and return
    else
      render action: :new and return
    end
  end

  def upgrade
    @user = User.find(params[:id])
    @user.upgrade
    unless @user.errors.blank?
      flash[:error] = @user.errors.messages[:base].first
    else
      flash[:notice] = "User upgraded"
    end
    redirect_to action: :index
  end

  def downgrade
    @user = User.find(params[:id])
    @user.downgrade
    unless @user.errors.blank?
      flash[:error] = @user.errors.messages[:base].first
    else
      flash[:notice] = "User downgraded"
    end
    redirect_to action: :index
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    if @user
      @user.destroy
      flash[:notice] = "User deleted"
    else
      flash[:notice]= "No such User found"
    end
    redirect_to action: :index
  end

  def update
    # required for settings form to submit when password is left blank
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end

    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "User upadted"
      redirect_to action: :index and return
    else
      render action: :edit and return
    end
  end


end
