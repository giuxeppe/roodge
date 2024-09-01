class RemovePropicFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :propic, :string
  end
end
