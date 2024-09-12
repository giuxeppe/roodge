class AddCommentiController < ApplicationController
  def new
    @commenti = Commenti.new
  end

  def create
      @room = Room.find(session[:selected_room_id])

      @user = User.find(session[:user_id])

      @materiale = Materiale.find(params[:materiale_id])
      
      @commenti = Commenti.new(commenti_params)

      @commenti.proprietario = @room.creatore
      @commenti.commentatore = @user.nome_utente
      @commenti.room = @room.id
      @commenti.materiale = @materiale.titolo

      if @commenti.save
          redirect_to room_logged_path(@room), notice: "Commento aggiunto con successo!"
      else
          redirect_to room_logged_path(@room), alert: "Errore nella creazione del commento"
      end
  end

  private

  def commenti_params
      params.require(:commenti).permit(:testo)
  end
end
