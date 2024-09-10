class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :nome, null: false
      t.string :creatore, null: false
      t.integer :post_utenti, null: false, default: 0
      t.string :descrizione

      t.timestamps
    end
  end
end
