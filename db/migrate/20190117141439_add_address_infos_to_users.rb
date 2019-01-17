class AddAddressInfosToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :address, :string
    add_column :users, :zipcode, :string
  end
end
