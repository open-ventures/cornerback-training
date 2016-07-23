class Signup < ActionMailer::Base
  default to: ["cornerbacktraining@gmail.com", 'accounts@wildfyregroup.com'],
          from: "cornerbacktraining.com"
  
  def sign_up_email(user)
    @user = user
    mail(subject: "A New User, ##{User.count}, has signed up for cornerbacktraining.com") 
  end
end
