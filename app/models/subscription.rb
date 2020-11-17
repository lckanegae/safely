class Subscription < ApplicationRecord
  belongs_to :item_design
  has_many :secured_items

  monetize :price_cents
end
