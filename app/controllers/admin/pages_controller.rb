class Admin::PagesController < ApplicationController

  layout "admin"

  before_filter :authenticate_admin!

  def index
    @pages = Page.page(params[:page]).per(20)
  end

  def publicize
    @page = Page.find(params[:id])
    @page.update_attributes(access: "public") if @page
    redirect_to action: :index
  end

  def privatize
    @page = Page.find(params[:id])
    @page.update_attributes(access: "restricted") if @page
    redirect_to action: :index
  end

end
