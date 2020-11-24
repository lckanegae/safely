class RemoveDaysFromSubscription < ActiveRecord::Migration[6.0]
  def change
    remove_column :subscriptions, :days
  end
end
