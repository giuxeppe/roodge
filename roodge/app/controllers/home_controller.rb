class HomeController < ApplicationController
  def index
    flash[:notice] = "Logged in successfully"
    flash[:alert] = "Invalid email or password"
  end

  def home_logged
    
  end
end
