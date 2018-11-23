class RefactorMeals < ActiveRecord::Migration[5.2]
  def change
    add_column :meals, :confirmed, :integer, default: 1
    add_column :meals, :remaining, :integer
  end
end
