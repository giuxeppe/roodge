class CreateStudenteRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :studente_rooms do |t|
      t.string :studente, null: false
      t.string :room, null: false
      t.integer :approvazioni, null: false, default: 0

      t.timestamps
    end
  end
end
