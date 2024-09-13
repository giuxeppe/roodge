class RemoveDescrizioneFromRooms < ActiveRecord::Migration[6.0]
  def change
    remove_column :rooms, :descrizione, :string
  end
end
