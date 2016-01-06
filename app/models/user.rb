class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validate :email_is_unique, on: :create
  after_create :create_account

  # Set not to send out the email for confirmation (Confirmation is disable by this function)
  def confirmation_required?
    false
  end

  private
  # Check unique email in Account Model
  def email_is_unique
    unless Account.find_by_email(email).nil?
      errors.add(:email, " is already taken")
    end
  end

  def create_account
    account = Account.new(:email => email)
    account.save!
  end
end
