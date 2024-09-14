class UserProvider < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  
  belongs_to :user

  def self.from_omniauth(auth)
    # Cerca un provider esistente oppure lo crea
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user_provider|
      user_provider.email = auth.info.email
      user_provider.token = auth.credentials.token
      user_provider.expires_at = Time.at(auth.credentials.expires_at)

      # Associa un utente a questo provider, creando un nuovo utente se necessario
      

      user = UserProvider.find_or_initialize_by(email: auth.info.email)
    
      if user.new_record?
        # Imposta i dettagli dell'utente solo se è un nuovo record
        user.fullname = auth.info.name
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        user.token = auth.credentials.token
        user.expires_at = Time.at(auth.credentials.expires_at) if auth.credentials.expires_at
        # Aggiungi altre impostazioni dell'utente se necessario
        user.save!
      end

      user_provider.user = user
      user_provider.save!

    end
  end
end