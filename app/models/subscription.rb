class Subscription < ApplicationRecord
  belongs_to :item_design
  monetize :price
end
