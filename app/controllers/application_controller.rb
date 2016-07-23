class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for(resource)
    if (current_user.sign_in_count < 2) && current_user.buy_now?
     upgrade_plan_path
   elsif current_user.payer?
     train_path
   else
     trial_path
   end
     end
   
end
