class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if session[:user_google_email].present?

      @user_provider = UserProvider.create!(
        email: session[:user_google_email], 
        password: Devise.friendly_token[0, 20],
        fullname: session[:user_google_name], 
        uid: session[:user_google_uid],
        avatar_url: session[:user_google_avatar_url],
        provider: 'google', 
        token: session[:user_google_token],
        expires_at: session[:user_google_expires_at]
      )

      if @user_provider.persisted?
        @user = User.new(user_params)
        if @user.save
          if @user.ruolo == 'd'
            save_tags_for_docente(@user)
          end
          session[:user_google_email] = nil
          session[:user_google_name] = nil
          session[:user_google_uid] = nil
          session[:user_google_avatar_url] = nil
          session[:user_google_token] = nil
          session[:user_google_expires_at] = nil
          redirect_to root_path, notice: 'Registrazione completata con successo!'
        else
          @user_provider.destroy
          flash.now[:alert] = 'Errore: bho'
          render :new
        end
      else
        redirect_to root_path, alert: 'Errore con i campi provider!'
      end
    else
      @user = User.new(user_params)
      if @user.save
        if @user.ruolo == 'd'
          save_tags_for_docente(@user)
        end
        redirect_to root_path, notice: 'Registrazione completata con successo!'
      else
        flash.now[:alert] = 'Errore: uno o più campi non sono stati compilati correttamente'
        render :new
      end
    end
  end

  private

  # Metodo per salvare i tag per il docente
  def save_tags_for_docente(user)
    tag1 = params[:user][:tag1]
    tag2 = params[:user][:tag2]
    tag3 = params[:user][:tag3]

    ActiveRecord::Base.transaction do
      [tag1, tag2, tag3].each do |tag|
        if tag.present?
          TagDocente.create!(docente: user.nome_utente, tag: tag.to_s)
        end
      end
    end    
  end

  def user_params
    params.require(:user).permit(:nome_utente, :nome, :cognome, :cf, :data_nascita, :citta_nascita, :indirizzo_residenza, :mail, :ruolo, :propic, :bio, :password, :password_confirmation, :tag1, :tag2, :tag3)
  end
end