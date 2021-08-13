class RenameAdressColumnToAddresses < ActiveRecord::Migration[5.2]
  def change
    rename_column :addresses, :adress, :address
  end
end
