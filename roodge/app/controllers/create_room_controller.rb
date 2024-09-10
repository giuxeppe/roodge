class CreateRoomController < ApplicationController
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.creatore = current_user.nome_utente

    if @room.save
      [:tag1, :tag2, :tag3].each do |tag_param|
        tag_value = params[tag_param]

        if tag_value.present?
          @tag_room = TagRoom.new(room: @room, tag: tag_value)

          unless @tag_room.save
            flash[:alert] = "Error saving tag: #{tag_param}"
            render :new and return
          end
        end
      end
      redirect_to create_room_path, notice: "Room was successfully created."
    else
      flash[:alert] = "There was an error creating the room."
      render :new
    end
  end

  private

  def room_params
    params.require(:room).permit(:nome, :post_utenti, :description)
  end
end
