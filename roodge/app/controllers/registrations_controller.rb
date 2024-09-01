class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: 'Registrazione completata con successo!'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:nome_utente, :nome, :cognome, :cf, :data_nascita, :citta_nascita, :indirizzo_residenza, :mail, :ruolo, :propic, :bio, :password, :password_confirmation)
  end
end