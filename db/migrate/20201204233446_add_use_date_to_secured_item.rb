class AddUseDateToSecuredItem < ActiveRecord::Migration[6.0]
  def change
    add_column :secured_items, :use_date, :boolean
  end
end
