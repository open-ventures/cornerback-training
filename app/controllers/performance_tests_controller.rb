class PerformanceTestsController < ApplicationController

  before_filter :authenticate_user!

  def update
    if current_user.performance_test.update_attributes(params[:performance_test])
      flash[:notice] = "Your performance has been updated"
      redirect_to edit_user_registration_path
    else
      render "users/registrations/edit"
    end

  end
end
