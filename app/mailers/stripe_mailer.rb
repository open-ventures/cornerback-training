class StripeMailer < ActionMailer::Base
  default from: "cornerbacktraining@gmail.com"
  
  def after_purchase_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Cornerback Training')
  end
  
  def admin_notifcation_email(user)
    @user = user
    mail(to: ["cornerbacktraining@gmail.com", "accounts@wildfyregroup.com"], subject: "A Shutdown Cornerback Program Has Been Purchased.")
  end
end
