class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2, :facebook]

  has_many :posts     
  has_many :comments     

  private

  def self.from_omniauth(access_token)
    data = access_token.info
    if data["email"]
      user = User.where(:email => data["email"]).first 
    else
      user = User.where(:email => "#{access_token.uid}@#{access_token.provider}.com").first
    end 

    unless user
        user = User.create(email: data["email"] ? data["email"] : "#{access_token.uid}@#{access_token.provider}.com",
           password: Devise.friendly_token[0,20]
        )
    end
    user
	end 	
end
