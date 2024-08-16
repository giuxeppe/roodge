class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :nome_utente, null: false
      t.string :nome, null: false
      t.string :cognome, null: false
      t.string :cf, null: false
      t.date :data_nascita, null: false
      t.string :citta_nascita, null: false
      t.string :indirizzo_residenza, null: false
      t.string :mail, null: false
      t.string :ruolo, null: false, default: 's'
      t.string :propic, null: false
      t.string :bio

      t.timestamps
    end

    add_index :users, :nome_utente, unique: true
  end
end
