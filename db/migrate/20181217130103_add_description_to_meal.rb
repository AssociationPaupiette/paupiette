class AddDescriptionToMeal < ActiveRecord::Migration[5.2]
  def change
    add_column :meals, :description, :text
    add_column :meals, :formula, :integer
  end
end
