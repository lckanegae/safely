class CreateItemDesigns < ActiveRecord::Migration[6.0]
  def change
    create_table :item_designs do |t|
      t.string :name
      t.monetize :refund_price
      t.string :item_type

      t.timestamps
    end
  end
end
