class ProfilesController < ApplicationController
  before_filter :authenticate_user!

  def show
  	current_user.profile
  end

  def update
    if current_user.profile.update_attributes(params[:profile])
      flash[:notice] = "Your profile has been updated"
      redirect_to edit_user_registration_path and return
    end
    render "users/registrations/edit"
  end


end
