class AddTotalPriceToSecuredItem < ActiveRecord::Migration[6.0]
  def change
    add_monetize :secured_items, :total_price
  end
end
