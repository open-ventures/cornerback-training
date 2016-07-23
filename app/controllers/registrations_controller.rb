class RegistrationsController < Devise::RegistrationsController

  before_filter :authenticate_user!, only: [:edit_plan, :upgrade]
  
  before_filter :non_paying_user, only: [:edit_plan, :upgrade]

  def edit
    super
  end

  def new
    if params[:plan] == "paid"
      @plan = "paid"
    end
    super
  end

  def edit_plan
    @user = current_user
  end

  def upgrade
    @user = current_user
    @user.stripe_token = params[:user][:stripe_token]
    if @user.save
      StripeMailer.after_purchase_email(@user).deliver
      StripeMailer.admin_notifcation_email(@user).deliver
      flash[:notice] = "Purchase Successful"
      redirect_to train_path and return
    end
    render action: :edit_plan and return
  end

  def create
    if params[:plan] == "paid"
      @plan = "paid"
    end
    super
  end

  protected

  def non_paying_user
    if user_signed_in?
      if current_user.payer?
        flash[:notice] = "You already have an active membership and can access the full program"
        redirect_to train_path
      end
    else
      redirect_to new_user_registration_path
    end
  end
  
  def after_inactive_sign_up_path_for(resource)
    if resource.buy_now?
      "/email-confirm"
    else
      "/trial-confirm"
    end 
  end




end

