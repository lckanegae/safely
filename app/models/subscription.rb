class Subscription < ApplicationRecord
  belongs_to :item_design
  has_many :secured_subscriptions

  monetize :price_cents
end
