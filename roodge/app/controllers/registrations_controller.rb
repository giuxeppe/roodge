class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Se l'utente è un docente, salva i tag associati
      if @user.ruolo == 'd'
        save_tags_for_docente(@user)
      end
      redirect_to root_path, notice: 'Registrazione completata con successo!'
    else
      flash.now[:alert] = 'Errore: uno o più campi non sono stati compilati correttamente'
      render :new
    end
  end

  private

   # Metodo per salvare i tag per il docente
   def save_tags_for_docente(user)
    tag1 = params[:user][:tag1]
    tag2 = params[:user][:tag2]
    tag3 = params[:user][:tag3]

    # Creiamo una riga nella tabella tag_docentes per ogni tag selezionato
    [tag1, tag2, tag3].each do |tag|
      if tag.present?
        TagDocente.create(docente: user.nome_utente, tag: tag)
      end
    end
  end

  def user_params
    params.require(:user).permit(:nome_utente, :nome, :cognome, :cf, :data_nascita, :citta_nascita, :indirizzo_residenza, :mail, :ruolo, :propic, :bio, :password, :password_confirmation)
  end
end