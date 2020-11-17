class RemoveRefundPriceFromItemDesigns < ActiveRecord::Migration[6.0]
  def change
    remove_monetize :item_designs, :refund_price
  end
end
