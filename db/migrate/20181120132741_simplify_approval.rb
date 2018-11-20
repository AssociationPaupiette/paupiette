class SimplifyApproval < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :profile_verification
    add_column :users, :approved, :boolean, default: false
  end
end
