class BansController < ApplicationController
  def create
    user_nome_utente = params[:user_nome_utente]
    room_id = params[:room_id]

    ban = Ban.new(utente: user_nome_utente, room: room_id)

    if ban.save
      redirect_to room_logged_path(room_id), notice: 'Utente bannato con successo!'
    else
      redirect_to room_logged_path(room_id), alert: 'Errore durante il ban dell\'utente #{user_nome_utente}'
    end
  end
end
