class ItemDesign < ApplicationRecord
  has_many :secured_items

  monetize :refund_cents
end
