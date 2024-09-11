class AddMaterialController < ApplicationController
    def create
        @room = Room.find(session[:selected_room_id])

        @user = User.find(session[:user_id])

        @material = Materiale.new(material_params)


        if @material.save
            redirect_to room_path(@room), notice: "Materiale aggiunto con successo!"
        else
            flash[:alert] = "Errore nella creazione del materiale"
            render :new
        end
    end

    private

    def material_params
        params.require(:user).permit(:titolo, :descrizione, :prezzo, :allegato)
    end
end