class Admin::DashboardController < ApplicationController

  before_filter :authenticate_admin!

  layout "admin"

  def index
    @users= User.page(params[:page]).per(20).order("created_at DESC")
  end

end
