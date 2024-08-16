class CreateRisposta < ActiveRecord::Migration[6.1]
  def change
    create_table :risposta do |t|
      t.integer :codice, null: false
      t.string :commento, null: false
      t.string :room, null: false
      t.string :proprietario, null: false
      t.string :titolo, null: false
      t.string :utente, null: false
      t.string :testo

      t.timestamps
    end
  end
end
