class AddForeignKeysToTagRooms < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :tag_rooms, :rooms, column: :room, primary_key: :id
    add_foreign_key :tag_rooms, :tags, column: :tag, primary_key: :id
  end
end
