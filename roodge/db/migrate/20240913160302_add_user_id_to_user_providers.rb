class AddUserIdToUserProviders < ActiveRecord::Migration[6.1]
  def change
    add_reference :user_providers, :user, foreign_key: true
  end
end