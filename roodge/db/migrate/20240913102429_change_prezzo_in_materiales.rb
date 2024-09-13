class ChangePrezzoInMateriales < ActiveRecord::Migration[6.0]
  def change
    change_column :materiales, :prezzo, :decimal, precision: 10, scale: 2, default: 0, null: false
  end
end
