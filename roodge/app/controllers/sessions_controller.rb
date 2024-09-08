class SessionsController < ApplicationController
    def new
        # Visualizza la pagina di login
        redirect_to root_path
    end

    def create
      user = User.find_by(nome_utente: params[:username])
      @rooms = Room.all
  
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
      @rooms = Room.all
      flash.now[:alert] = 'Logout effettuato con successo'
      session[:user_id] = nil
      render 'home/index'
    end

    def failure
      render plain: "Authentication failed!"
    end
  end