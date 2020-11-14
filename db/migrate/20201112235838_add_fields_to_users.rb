class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :adress, :string
    add_column :users, :phone_number, :string
    add_column :users, :birth_date, :date
    add_column :users, :cpf, :string
    add_column :users, :card_id, :integer
  end
end
