class AddInfosToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :description, :text
    add_column :users, :specialties, :text
    add_column :users, :reception_days, :string
    add_column :users, :profile_status, :integer, default: 0
    add_column :users, :role, :integer, default: 0
  end
end
