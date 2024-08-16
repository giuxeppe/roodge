class CreateTagDocentes < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_docentes do |t|
      t.string :docente, null: false
      t.string :tag, null: false

      t.timestamps
    end
  end
end
