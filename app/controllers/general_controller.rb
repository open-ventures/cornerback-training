class GeneralController < ApplicationController
  before_filter :authenticate_user!, only: [:trial, :train]
  
  def email_confirm
  end
  
  def trial_confirm
  end
  
  def trial
    if current_user.payer?
      redirect_to train_path
    else
      trial_path
    end
  end
  
  def train
    if current_user.payer?
      train_path
    else
      redirect_to trial_path
    end
  end
  
  def hangout;end
  
  def cornerback_training_goals;end
  def cornerback_training_phases;end
  def cornerback_training_weekly_breakdown;end
  def cornerback_training_schedule;end
  def cornerback_training_workout_structure;end
    
  
end
