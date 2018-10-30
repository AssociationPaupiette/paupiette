class AddActiveToCities < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :active, :boolean, default: false
  end
end
