class AddDescriptionToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :description, :text
  end
end
