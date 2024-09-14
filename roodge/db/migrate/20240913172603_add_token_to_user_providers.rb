class AddTokenToUserProviders < ActiveRecord::Migration[6.1]
  def change
    add_column :user_providers, :token, :string
  end
end
