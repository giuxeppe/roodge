class HomeController < ApplicationController
  def index
    @rooms = Room.all
  end

  def home_logged
    @user = User.find(session[:user_id])
  end

  def info_student
    @user = User.find(session[:user_id])
  end

  def registration
  end

  def final_registration
  end

  def info_professor
  end

  def info_student
  end

  def room_unlogged
  end

  def room_logged
  end

  def create_room
  end

end
