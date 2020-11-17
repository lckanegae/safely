class AddRefundPriceToItemDesigns < ActiveRecord::Migration[6.0]
  def change
    add_monetize :item_designs, :refund
  end
end
