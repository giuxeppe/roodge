class AddTagsToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :tag1, :string
    add_column :rooms, :tag2, :string
    add_column :rooms, :tag3, :string
  end
end
