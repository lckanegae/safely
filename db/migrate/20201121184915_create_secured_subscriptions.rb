class CreateSecuredSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :secured_subscriptions do |t|
      t.references :subscription, null: false, foreign_key: true
      t.references :secured_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
