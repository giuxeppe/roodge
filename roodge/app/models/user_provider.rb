class UserProvider < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  
  belongs_to :user

  def self.from_omniauth(auth)
    
    data = auth.info
    user = UserProvider.where(email: data['email']).first

    unless user
        user = UserProvider.create(
           email: data['email'],
           password: Devise.friendly_token[0,20]
        )
    end
    user
  end
end