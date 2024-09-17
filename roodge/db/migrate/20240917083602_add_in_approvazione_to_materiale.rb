class AddInApprovazioneToMateriale < ActiveRecord::Migration[6.1]
  def change
    add_column :materiales, :in_approvazione, :integer, default: 0, null: false
  end
end
