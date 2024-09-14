class AddTagsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :tag1, :string
    add_column :users, :tag2, :string
    add_column :users, :tag3, :string
  end
end
