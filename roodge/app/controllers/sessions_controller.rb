class SessionsController < ApplicationController
    def new
        # Visualizza la pagina di login
        redirect_to root_path
    end

    def create
      user = User.find_by(nome_utente: params[:username])
  
      if user && user.authenticate(params[:password])
        # Se l'autenticazione ha successo, salva l'utente nella sessione
        session[:user_id] = user.id
        redirect_to home_logged_path
      else
        flash.now[:alert] = 'Nome utente o password non validi'
        render 'home/index'
      end
    end

    def destroy
      flash.now[:alert] = 'LOGOUT'
      session[:user_id] = nil
      redirect_to root_path
    end

    def failure
      render plain: "Authentication failed!"
    end
  end