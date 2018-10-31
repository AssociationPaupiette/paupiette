class ChangeProfileStatusColumnInUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :profile_status, :profile_verification
  end
end
