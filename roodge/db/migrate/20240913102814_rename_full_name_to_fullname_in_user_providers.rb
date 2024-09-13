class RenameFullNameToFullnameInUserProviders < ActiveRecord::Migration[6.0]
  def change
    rename_column :user_providers, :full_name, :fullname
  end
end
