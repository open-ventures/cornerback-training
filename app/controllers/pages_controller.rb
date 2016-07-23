class PagesController < ApplicationController

  before_filter :authenticate_user!, except: [:privacy, :terms]
  before_filter :ensure_access, except: [:privacy, :terms]

  def show
    render @page.slug and return if @page
    if @page.nil?
      render text: "404 Not Found", status: 404 and return
    else
      render text: "Access denied must pay for this cool stuff" and return
    end
  end


  protected
  def ensure_access
    @page = Page.find_by_slug(params[:id])
    render "public/404" and return unless @page
    if !current_user.payer? && @page.access.restricted?
      redirect_to upgrade_plan_path
    end
  end

end
