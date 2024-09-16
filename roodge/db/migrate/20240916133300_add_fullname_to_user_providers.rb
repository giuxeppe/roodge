class AddFullnameToUserProviders < ActiveRecord::Migration[6.1]
  def change
    add_column :user_providers, :fullname, :string
  end
end
