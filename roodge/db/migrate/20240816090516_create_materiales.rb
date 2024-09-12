class CreateMateriales < ActiveRecord::Migration[6.1]
  def change
    create_table :materiales do |t|
      t.string :titolo, null: false
      t.string :proprietario, null: false
      t.string :room, null: false
      t.string :descrizione
      t.string :allegato
      t.integer :approvato, null: false, default: 0
      t.decimal :prezzo, null: false, default: 0

      t.timestamps
    end
  end
end
