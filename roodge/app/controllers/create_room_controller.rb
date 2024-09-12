class CreateRoomController < ApplicationController
  def new
    @room = Room.new
  end 

  def create
    @room = Room.new(room_params)
    @room.creatore = current_user.nome_utente

    if @room.save
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
      redirect_to create_room_path, notice: "Room was successfully created."
    else
      flash[:alert] = "There was an error creating the room."
      render :new
    end
  end

  private

  def room_params
    params.require(:room).permit(:nome, :tag1, :tag2, :tag3, :description, :post_utenti, :codice)
  end  
end
