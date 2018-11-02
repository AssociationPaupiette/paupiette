class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :from
      t.references :to
      t.references :meal, foreign_key: true
      t.text :content
      t.datetime :read_at
      
      t.timestamps
    end
  end
end
