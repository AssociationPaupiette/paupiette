class CreateAmbassadorshipsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :ambassadorships do |t|
      t.integer :user_id
      t.integer :city_id
      t.timestamps
    end

    add_index :ambassadorships, :user_id
    add_index :ambassadorships, :city_id
  end
end
