class CreateConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :conversations do |t|
      t.timestamps
    end
    create_join_table :conversations, :users
    remove_column :messages, :meal_id
    remove_column :messages, :to_id
    add_column :messages, :conversation_id, :integer, index: true, foreign_key: true
  end
end
