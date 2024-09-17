class MaterialsController < ApplicationController
  def approve

    material = Materiale.find(params[:material_id])

    user = params[:user_name]

    room_id = params[:room_id]
    
    if(StudenteRoom.where(room: room_id, studente: user).exists?)
        @studente_rooms = StudenteRoom.find_by(room: room_id, studente: user)
        @approvazioni = @studente_rooms.approvazioni
        @approvazioni += 1
        @studente_rooms.approvazioni = @approvazioni
        @studente_rooms.save
        if(material.in_approvazione == 0)
            material.in_approvazione = 1
            material.save
        end
        
        if(@studente_rooms.approvazioni >= 10)
            material.approvato = 1
            material.save
        end
    else
        @studente_rooms = StudenteRoom.new(room: room_id, studente: user, approvazioni: 1)

        if @studente_rooms.save
          material.in_approvazione = 1
          material.save
        end
    end

    material.approvato = 1
    material.save
    
    if(material.approvato == 1)
      redirect_to room_logged_path(room_id), notice: 'Materiale approvato con successo!'
    else
      redirect_to room_logged_path(room_id), notice: 'Materiale non approvato con successo!'
    end
  end
end
