# frozen_string_literal: true

class UserProviders::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  def google_oauth2
    @user_provider = UserProvider.from_omniauth(request.env['omniauth.auth'])
  
    if @user_provider.user
      sign_in_and_redirect @user_provider.user, event: :authentication
      set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
    else
      redirect_to registration_url, alert: 'Non risulti registrato. Registrati per accedere.'
    end
  end

  def failure
    redirect_to root_path
  end
end
