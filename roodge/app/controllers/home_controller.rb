class HomeController < ApplicationController
    def index
      if session[:user_id].present?
        redirect_to home_logged_path
      end
      @rooms = Room.all
      @tag_rooms = TagRoom.all
      @tags = Tag.all
      @devise_mapping = Devise.mappings[:user_provider]
      @resource_class = UserProvider
      @resource_name = :user_provider
    end
  
    def home_logged
      if session[:user_id].present?
        @user = User.find(session[:user_id])
        @rooms = Room.all
        @tag_rooms = TagRoom.all
        @tags = Tag.all
      else
        redirect_to root_path
      end
    end
  
    def registration
    end
  
    def final_registration
    end
  
    def room_unlogged
      @room = Room.find(params[:id])
      @tag_rooms = TagRoom.all
      @tags = Tag.all
      session[:selected_room_id] = @room.id
      @materials = Materiale.where(room: @room.id)
      @devise_mapping = Devise.mappings[:user_provider]
      @resource_class = UserProvider
      @resource_name = :user_provider
      @commenti = Commenti.where(room: @room.id)
      @st_rooms = StudenteRoom.all
    end
  
    def room_logged
      @room = Room.find(params[:id])
      @tag_rooms = TagRoom.all
      @tags = Tag.all
      session[:selected_room_id] = @room.id
      @materials = Materiale.where(room: @room.id)
      @commenti = Commenti.where(room: @room.id)
      @tag_docente = TagDocente.all
      @st_rooms = StudenteRoom.all
      @ban = Ban.where(room: @room.id)
      @user = User.find(session[:user_id])
      if(@ban.exists?(utente: @user.nome_utente, room: @room.id))
        redirect_to home_logged_path, alert: "Sei stato bannato da questa room"
      end
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
  
    def other_user_info
      @other_user = User.find_by(nome_utente: params[:nome_utente])
      session[:selected_user] = @other_user.nome_utente
      @tag_docenti = TagDocente.all
      @rooms = Room.all
      @classi_approvate = StudenteRoom.where(studente: @other_user.nome_utente)
                                .where(approvazioni: 3...10)
                                .map(&:room)
      @classi_studente_modello = StudenteRoom.where(studente: @other_user.nome_utente)
                                .where('approvazioni >= ?', 10)
                                .map(&:room)
    end
  
    def add_material
      if session[:user_id].present?
        @user = User.find(session[:user_id])
        @material = Materiale.new
  
        if session[:selected_room_id].present?
          @selected_room = Room.find(session[:selected_room_id])

          if(@selected_room.post_utenti == 1)
            if(@selected_room.creatore != @user.nome_utente)
                redirect_to root_path, alert: "Non puoi aggiungere materiale in questa room"
            end
        end
        else
          redirect_to root_path
        end
      else
        redirect_to root_path
      end
    end

    def all_rooms_unlogged
      @rooms = Room.all
      @tag_rooms = TagRoom.all
      @tags = Tag.all
      @devise_mapping = Devise.mappings[:user_provider]
      @resource_class = UserProvider
      @resource_name = :user_provider
    end

    def add_commenti
      if session[:user_id].present?
        @user = User.find(session[:user_id])
        @commenti = Commenti.new
  
        if session[:selected_room_id].present?
          @selected_room = Room.find(session[:selected_room_id])
          @materiale = Materiale.find(params[:materiale_id])
        else
          redirect_to root_path
        end
      else
        redirect_to root_path
      end
    end

    def all_rooms_logged
      @rooms = Room.all
      @tag_rooms = TagRoom.all
      @tags = Tag.all
      @user = User.find(session[:user_id])
    end

    def info_user
      @tag_docenti = TagDocente.all
      @tags = Tag.all
      @user = User.find(session[:user_id])
      @rooms = Room.all
      @classi_approvate = StudenteRoom.where(studente: @user.nome_utente)
                                .where(approvazioni: 3...10)
                                .map(&:room)
      @classi_studente_modello = StudenteRoom.where(studente: @user.nome_utente)
                                .where('approvazioni >= ?', 10)
                                .map(&:room)


    end

    def payment
      @material = Materiale.find(params[:materiale_id])
      @user = User.find(session[:user_id])
    end
    
    def confirm_payment
      @material = Materiale.find(params[:materiale_id])
      redirect_to room_logged_path(@material.room), notice: "Pagamento effettuato con successo!"
    end
  
end