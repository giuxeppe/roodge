# frozen_string_literal: true

class UserProviders::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  def google_oauth2
    @user_provider = UserProvider.from_omniauth(request.env['omniauth.auth'])
  
    if @user_provider.persisted?
      sign_in_and_redirect @user_provider
    else
      session[:user_google_email] = @user_provider.email
      redirect_to new_user_provider_registration_path, alert: "#{@user_provider.email} non risulta registrata. Registrati per accedere."
    end
  end
  
  def failure
    flash[:error] = "C'è stato un errore nel riconoscimento..."
    redirect_to root_path
  end
  

end
