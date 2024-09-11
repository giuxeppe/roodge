class CreateTagRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_rooms do |t|
      t.string :room, null: false
      t.string :tag, null: false

      t.timestamps
    end
  end
end