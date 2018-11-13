class CreatePreregisters < ActiveRecord::Migration[5.2]
  def change
    create_table :preregisters do |t|
      t.string :first_name
      t.string :email
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
