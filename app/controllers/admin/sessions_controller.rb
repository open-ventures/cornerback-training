class Admin::SessionsController < Devise::SessionsController
  layout "admin"

  protected

  def after_sign_in_path_for(resource)
    admin_dashboard_path
  end
end
