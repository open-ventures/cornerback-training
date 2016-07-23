class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :validatable, :database_authenticatable, :trackable, :timeoutable
  attr_accessible :email, :password, :password_confirmation
end
