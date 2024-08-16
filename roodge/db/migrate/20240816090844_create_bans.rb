class CreateBans < ActiveRecord::Migration[6.1]
  def change
    create_table :bans do |t|
      t.string :utente, null: false
      t.string :room, null: false

      t.timestamps
    end
  end
end
