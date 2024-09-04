class HomeController < ApplicationController
  def index
  end

  def home_logged
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
end
