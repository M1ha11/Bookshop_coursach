class User < ApplicationRecord
  #has_one :cart
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :welcome_send
  
  def welcome_send
    UserMailer.with(user: @user).welcome_email.deliver_later
  end       
end
