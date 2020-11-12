class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.references :item_design, null: false, foreign_key: true
      t.string :subscription_type
      t.monetize :price
      t.integer :days

      t.timestamps
    end
  end
end
