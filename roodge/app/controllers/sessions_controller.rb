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
        redirect_to home_logged_path, notice: "Logged in con Username e Password!"
      else
        redirect_to root_path, alert: "Nome utente o password non validi!"
      end 
    end

    def destroy
      @rooms = Room.all
      session[:user_id] = nil
      sign_out(current_user)
      redirect_to root_path, notice: "Logged effettuato con successo!"
    end

    def failure
      redirect_to root_path, alert: "Authentication failed, please try again."
    end
  end