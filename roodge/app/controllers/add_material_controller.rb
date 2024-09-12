
class AddMaterialController < ApplicationController

    def new
        @material = Materiale.new
    end

    def create
        @room = Room.find(session[:selected_room_id])

        @user = User.find(session[:user_id])

        @material = Materiale.new(material_params)

        @material.proprietario = @user.nome_utente
        @material.room = @room.id

        if @material.save
            redirect_to room_logged_path(@room), notice: "Materiale aggiunto con successo!"
        else
            redirect_to room_logged_path(@room), alert: "Errore nella creazione del materiale"
        end
    end

    private

    def material_params
        params.require(:materiale).permit(:titolo, :descrizione, :prezzo, :allegato)
    end
end
