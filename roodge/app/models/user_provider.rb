class UserProvider < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
        
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user_provider|
      user_provider.email = auth.info.email
      user_provider.password = Devise.friendly_token[0, 20]
      user_provider.fullname = auth.info.name
      user_provider.avatar_url = auth.info.image
    end
  end
end
