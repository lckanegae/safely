class ChangeAdressToAddressInUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :adress, :address
  end
end
