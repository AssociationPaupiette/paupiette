class AddSlugsToUsersAndCities < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :slug, :string, default: '', null: false
    add_column :users, :slug, :string, default: '', null: false
  end
end
