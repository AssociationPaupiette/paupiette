class CreateEmbassiesJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :embassies, id: false do |t|
      t.integer :user_id
      t.integer :city_id
    end

    add_index :embassies, :user_id
    add_index :embassies, :city_id
  end
end
