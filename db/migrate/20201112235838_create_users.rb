class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :phone_number
      t.integer :age
      t.integer :cpf
      t.integer :card_id

      t.timestamps
    end
  end
end
