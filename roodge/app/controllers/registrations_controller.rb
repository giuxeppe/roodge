class RegistrationsController < ApplicationController
  before_action :ensure_registration_completed, only: [:edit_final, :update_final]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:registration_completed] = true
      redirect_to final_registration_path(@user)
    else
      render :new
    end
  end

  def edit_final
    @user = User.find(params[:id])
    # Renderizza la vista per `final_registration`
  end

  def update_final
    @user = User.find(params[:id])
    if @user.update(user_final_params)
      session[:registration_completed] = nil
      redirect_to root_path, notice: "Registrazione completata!"
    else
      render :edit_final
    end
  end

  private

  def user_params
    params.require(:user).permit(:nome, :cognome, :cf, :data_nascita, :citta_nascita, :indirizzo_residenza, :mail, :ruolo)
  end

  def user_final_params
    params.require(:user).permit(:nome_utente, :password, :propic, :bio)
  end

  def ensure_registration_completed
    unless session[:registration_completed]
      redirect_to registration_path, alert: "Per favore, completa prima la registrazione."
    end
  end
end

