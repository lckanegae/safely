class SecuredItem < ApplicationRecord
  belongs_to :user
  belongs_to :item_design
  belongs_to :subscription
end
