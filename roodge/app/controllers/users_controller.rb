  class UsersController < ApplicationController
    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to index_path, notice: 'Registrazione completata con successo!'
      else
        render :registration
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(
        :nome_utente, 
        :password, 
        :nome, 
        :cognome, 
        :cf, 
        :data_nascita, 
        :citta_nascita, 
        :indirizzo_residenza, 
        :mail, 
        :ruolo, 
        :propic, 
        :bio
      )
    end
  end