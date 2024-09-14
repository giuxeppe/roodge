class RemovePasswordAndPasswordConfirmationFromUserProviders < ActiveRecord::Migration[6.1]
  def change
    remove_column :user_providers, :password, :string
    remove_column :user_providers, :password_confirmation, :string
  end
end
