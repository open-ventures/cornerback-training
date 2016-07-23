class Admin::AdminUsersController < ApplicationController
  before_filter :authenticate_admin!
  layout "admin"

  def index
    @admin_users = Admin.all
  end

  def new
    @admin_user = Admin.new
  end

  def create
    @admin_user = Admin.new(params[:admin])
    if @admin_user.save
      redirect_to action: :index and return
    else
      render action: :new and return
    end
  end

  def edit
    @admin_user = Admin.find(params[:id])
  end

  def destroy
    @admin_user = Admin.find(params[:id])
    if @admin_user && @admin_user.id == current_admin.id
      flash[:error] = "Cannot deelte yourself"
    elsif @admin_user
      @admin_user.destroy
      flash[:notice] = "Admin User deleted"
    else
      flash[:notice]= "No such Admin User found"
    end
    redirect_to action: :index
  end

  def update
    @admin_user = Admin.find(params[:id])
    @admin_user.update_attributes(params[:admin]) if @admin_user
    flash[:notice] = "Admin user upadted"
    redirect_to action: :index
  end

end
