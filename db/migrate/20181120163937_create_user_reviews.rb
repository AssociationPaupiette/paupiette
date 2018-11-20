class CreateUserReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :user_reviews do |t|
      t.references :from, foreign_key: {to_table: :users}
      t.references :about, foreign_key: {to_table: :users}
      t.text :text
      t.boolean :approved, default: false

      t.timestamps
    end
  end
end
