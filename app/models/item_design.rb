class ItemDesign < ApplicationRecord
  include PgSearch::Model
  
  has_many :secured_items

  monetize :refund_cents

end
