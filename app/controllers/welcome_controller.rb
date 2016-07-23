class WelcomeController < ApplicationController
  layout "landing"
  
  def index 
    if user_signed_in?
      if current_user.payer?
        redirect_to train_path
      else
        redirect_to trial_path
      end
    else
      root_path
      end
  end
  
  
end

