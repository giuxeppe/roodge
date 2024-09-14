# frozen_string_literal: true

class UserProviders::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  def google_oauth2
    @user_provider = UserProvider.find_or_initialize_by(email: omniauth_data['info']['email'], provider: 'google')
    @user_provider.fullname = omniauth_data['info']['name']
    @user_provider.uid = omniauth_data['uid']
    @user_provider.avatar_url = omniauth_data['info']['image']
    @user_provider.token = omniauth_data['credentials']['token']
    @user_provider.expires_at = Time.at(omniauth_data['credentials']['expires_at'])

    if @user_provider.save
      user = User.find_by(mail: @user_provider.email)

      @rooms = Room.all
  
      if user
        session[:user_id] = user.id
        session[:user_google_email] = nil
        redirect_to home_logged_path, notice: "Logged in con Google!"
      else
        redirect_to root_path, alert: "Autenticazione non riuscita!"
      end 
    else
      session[:user_google_email] = @user_provider.email
      session[:user_google_email] = @user_provider.email
      session[:user_google_name] = @user_provider.fullname
      session[:user_google_uid] = @user_provider.uid
      session[:user_google_avatar_url] = @user_provider.avatar_url
      session[:user_google_token] = @user_provider.token
      session[:user_google_expires_at] = @user_provider.expires_at
      redirect_to registration_path, alert: "#{@user_provider.email} non risulta registrata. Registrati per accedere."
    end
  end

  private

  def omniauth_data
    request.env['omniauth.auth']
  end

end
