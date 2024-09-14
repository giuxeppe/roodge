class RemoveUserReferenceFromUserProviders < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :user_providers, :users
    remove_reference :user_providers, :user, index: true
  end
end
