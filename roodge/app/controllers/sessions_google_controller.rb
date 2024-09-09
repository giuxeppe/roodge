class SessionsGoogleController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    puts auth.inspect # Controlla cosa contiene l'oggetto `auth`

    if auth
      user = User.from_omniauth(auth)
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully"
    else
      redirect_to root_path, alert: "Authentication failed"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end

  def failure
    redirect_to root_path, alert: "Authentication failed, please try again."
  end
end
