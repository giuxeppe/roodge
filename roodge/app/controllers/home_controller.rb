class HomeController < ApplicationController
  def index
    if session[:user_id].present?
      redirect_to home_logged_path
    end
    @rooms = Room.all
    @devise_mapping = Devise.mappings[:user_provider] # Sostituisci `:user` con il tuo modello, ad es. `:user_provider` se usi quello
    @resource_class = UserProvider # Sostituisci `User` con il tuo modello
    @resource_name = :user_provider # Sostituisci `:user` con il tuo modello, ad es. `:user_provider` se usi quello
  end

  def home_logged
    if session[:user_id].present?
      @user = User.find(session[:user_id])
    else
      redirect_to root_path
    end
  end

  def info_student
    if session[:user_id].present?
      @user = User.find(session[:user_id])
    else
      redirect_to root_path
    end
  end

  def registration
  end

  def final_registration
  end

  def info_professor
    if session[:user_id].present?
      @user = User.find(session[:user_id])
    else
      redirect_to root_path
    end
  end

  def info_student
    if session[:user_id].present?
      @user = User.find(session[:user_id])
    else
      redirect_to root_path
    end
  end

  def room_unlogged
  end

  def room_logged
  end

  def create_room
    if session[:user_id].present?
      @user = User.find(session[:user_id])
      if @user.ruolo == "d"
        @room = Room.new
      else
        redirect_to home_logged_path
      end
    else
      redirect_to root_path
    end
  end

end
