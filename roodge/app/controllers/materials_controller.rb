class MaterialsController < ApplicationController
  def approve

    #modificareeee
    material = Materiale.find(params[:material_id])

    room_id = params[:room_id]

    if material.update(approvato: 1)
      redirect_to room_logged_path(room_id), notice: 'Materiale approvato con successo!'
    else
      redirect_to room_logged_path(room_id), alert: 'Errore durante l\'approvazione del materiale.'
    end
  end
end
