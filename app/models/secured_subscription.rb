class SecuredSubscription < ApplicationRecord
  belongs_to :subscription
  belongs_to :secured_item
end
