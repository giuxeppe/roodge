class AddMaterialeToCommenti < ActiveRecord::Migration[6.1]
  def change
    add_column :commentis, :materiale, :string
  end
end
