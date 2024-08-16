class CreateCronologiaVisitates < ActiveRecord::Migration[6.1]
  def change
    create_table :cronologia_visitates do |t|
      t.string :utente, null: false
      t.integer :numero_ord, null: false, default: 0
      t.string :room, null: false

      t.timestamps
    end
  end
end
