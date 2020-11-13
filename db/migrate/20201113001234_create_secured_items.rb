class CreateSecuredItems < ActiveRecord::Migration[6.0]
  def change
    create_table :secured_items do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item_design, null: false, foreign_key: true
      t.references :subscription, null: false, foreign_key: true
      t.date :activation_date
      t.date :expiration_date

      t.timestamps
    end
  end
end
