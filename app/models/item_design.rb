class ItemDesign < ApplicationRecord
  include PgSearch::Model
  has_many :secured_items
  has_one_attached :design
  monetize :refund_cents
end
