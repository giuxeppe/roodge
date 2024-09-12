class CreateCommentis < ActiveRecord::Migration[6.1]
  def change
    create_table :commentis do |t|
      t.string :room, null: false
      t.string :proprietario, null: false
      t.string :commentatore, null: false
      t.string :testo

      t.timestamps
    end
  end
end
