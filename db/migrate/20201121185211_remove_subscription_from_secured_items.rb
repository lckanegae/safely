class RemoveSubscriptionFromSecuredItems < ActiveRecord::Migration[6.0]
  def change
    remove_reference :secured_items, :subscription, null: false, foreign_key: true
  end
end
