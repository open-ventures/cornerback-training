class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,  :omniauthable, omniauth_providers: [:facebook]

  attr_accessible :email, :password, :remember_me, :password_confirmation, :full_name, :terms, :stripe_token, :provider, :uid, :buy_now, :coupon

  attr_accessor :terms, :stripe_token, :coupon

  validates :full_name, presence: true

  validates :terms, acceptance: true, allow_nil: false, on: :create

  has_one :profile
  has_one :performance_test

  before_save :setup_stripe, if: :has_stripe_token?

  after_create :setup_profile_and_performance, :sign_up_email

  extend Enumerize
  enumerize :plan, in: {
    free: 0,
    stripe_paid: 1,
    manually_paid: 2,
    stipe_paid_downgraded: 3
  }


  def sign_up_email
    Signup.sign_up_email(self).deliver
  end

  def confirmation_required?
    self.provider.nil? || self.uid.nil?
  end

  def has_stripe_token?
    !self.stripe_token.nil?
  end

  def setup_profile_and_performance
    if self.profile.nil?
      self.build_profile
      self.profile.save(validate: false)
    end
    if self.performance_test.nil?
      self.build_performance_test
      self.performance_test.save(validate: false)
    end
  end

  def payer?
    self.plan == "stripe_paid" || self.plan == "manually_paid"
  end

  def upgrade
    if self.payer?
      self.errors[:base] << "User is already a paying user"
    else
      self.update_attribute(:plan, 2)
    end
  end

  def downgrade
    unless self.payer? 
      self.errors[:base] << "User is Already a free user" 
    else
      if self.plan == "stripe_paid"
        self.update_attribute(:plan, 3)
      elsif self.plan== "manually_paid"
        self.update_attribute(:plan, 0)
      end
    end
  end

  def setup_stripe
    if stripe_id.nil?
      if !stripe_token.present?
        raise "Stripe token not present. Can't create account."
      end
  
        amount = 19700
      
      customer = Stripe::Customer.create(
        :email => email,
        :description => full_name,
        :card => stripe_token,
      )
      charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => amount,
      :description => 'Cornerback Membership',
      :currency    => 'usd'
      )
      self.stripe_id = customer.id
      self.stripe_token = nil
      self.plan = 1
    else
      charge = Stripe::Charge.create(
      :customer    => self.stripe_id,
      :amount      => amount,
      :description => 'Cornerback Membership',
      :currency    => 'usd'
      )
      self.stripe_token = nil
      self.plan = 1
    end
  rescue Stripe::StripeError => e
    logger.error "Stripe Error: " + e.message
    errors.add :base, "#{e.message}."
    self.stripe_token = nil
    false
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(email: auth.info.email).first
    unless user
      user = User.create!(full_name:auth.extra.raw_info.name,
       provider:auth.provider,
       uid:auth.uid,
       email:auth.info.email,
       password:Devise.friendly_token[0,20],
       terms: "1"
      )
  end
  user
end

end
