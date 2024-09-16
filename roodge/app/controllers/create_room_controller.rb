class CreateRoomController < ApplicationController
  def new
    @room = Room.new
  end 

  def create
    @room = Room.new(room_params)
    @room.codice = SecureRandom.hex(10) if @room.codice.blank?
    @room.creatore = current_user.nome_utente

    # Otteniamo i tag selezionati nel form
    selected_tags = [params[:room][:tag1], params[:room][:tag2], params[:room][:tag3]].compact

    # Recuperiamo i tag associati all'utente corrente
    user_tags = TagDocente.where(docente: current_user.nome_utente).pluck(:tag)

    # Verifica se c'è almeno un tag in comune
    if (selected_tags & user_tags).any?
      if @room.save
        # Salvataggio dei tag associati alla room
        [:tag1, :tag2, :tag3].each do |tag_param|
          tag_value = params[:room][tag_param.to_s]

          if tag_value.present?
            tag = Tag.find_by(id: tag_value)

            if tag
              @tag_room = TagRoom.create(room: @room.id, tag: tag_value)
              @tag_room.save
            else
              flash[:alert] = "Tag not found: #{tag_param}"
              render :new and return
            end
          end
        end
        redirect_to create_room_path, notice: "Room creata con successo."
      else
        flash[:alert] = "Errore nella creazione della room."
        render :new
      end
    else
      # Messaggio di errore se nessun tag coincide
      redirect_to create_room_path, notice: "Errore: selezionare almeno un tag che ti appartiene."
    end
  end

  private

  def room_params
    params.require(:room).permit(:nome, :tag1, :tag2, :tag3, :description, :post_utenti, :codice)
  end  
end