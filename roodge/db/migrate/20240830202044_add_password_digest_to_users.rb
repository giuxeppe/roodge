class AddPasswordDigestToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :password_digest, :string, null: false
    remove_column :users, :password, :string # Rimuovi la colonna password se esiste
  end
end
