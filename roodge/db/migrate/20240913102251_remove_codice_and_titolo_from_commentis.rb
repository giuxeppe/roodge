class RemoveCodiceAndTitoloFromCommentis < ActiveRecord::Migration[6.0]
  def change
    remove_column :commentis, :codice, :integer
    remove_column :commentis, :titolo, :string
  end
end
