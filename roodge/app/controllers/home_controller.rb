class HomeController < ApplicationController
  def index
    @rooms = Room.all
    @devise_mapping = Devise.mappings[:user_provider] # Sostituisci `:user` con il tuo modello, ad es. `:user_provider` se usi quello
    @resource_class = UserProvider # Sostituisci `User` con il tuo modello
    @resource_name = :user_provider # Sostituisci `:user` con il tuo modello, ad es. `:user_provider` se usi quello
  end

  def home_logged
    @user = User.find(session[:user_id])
  end


  def registration
  end

  def final_registration
  end

  def info_user
  end

  def room_unlogged
  end

  def room_logged
  end

  def create_room
  end

  def other_user_info
    @other_user = User.find_by(nome_utente: params[:nome_utente])
    session[:selected_user] = @other_user.nome_utente
  end

end
