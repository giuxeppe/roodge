# frozen_string_literal: true

class UserProviders::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  def google_oauth2
    @user = UserProvider.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user
    else
      session[:user_google_id] = @user.id
      redirect_to new_user_provider_registration_path, alert: "#{@user.email} non risulta registrata. Registrati per accedere."
    end
  end

  def failure
    flash[:error] = 'There was an error while trying to authenticate you...'
    redirect_to root_path
  end

end
