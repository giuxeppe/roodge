
class AddMaterialController < ApplicationController

    def new
        @material = Materiale.new
    end

    def create

        @room = Room.find(session[:selected_room_id])
        @user = User.find(session[:user_id])

        if(@room.post_utenti == 1)
            if(@room.creatore != @user.nome_utente)
                redirect_to room_logged_path(@room), alert: "Non puoi aggiungere materiale in questa room"
            end
        end

        @material = Materiale.new(material_params)
        @tag_docente = TagDocente.where(docente: @user.nome_utente)
        @tag_room = TagRoom.where(room: @room.id)
        @tag_docente.each do |tag|
            @tag_room.each do |tag2|
                if(tag.tag == tag2.tag)
                    @material.approvato = 1
                    break
                end
            end
        end

        if(@user.nome_utente == @room.creatore)
            @material.approvato = 1
        end

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
        params.require(:materiale).permit(:titolo, :descrizione, :prezzo, :approvato, :allegato)
    end
end
