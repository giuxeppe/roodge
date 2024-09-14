class AddExpiresAtToUserProviders < ActiveRecord::Migration[6.1]
  def change
    add_column :user_providers, :expires_at, :datetime
  end
end
