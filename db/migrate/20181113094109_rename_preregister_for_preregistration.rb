class RenamePreregisterForPreregistration < ActiveRecord::Migration[5.2]
  def change
    rename_table :preregisters, :preregistrations
  end
end
