class ItemDesign < ApplicationRecord
  include PgSearch::Model
  has_one_attached :design
  has_many :secured_items
  has_many :subscriptions
  monetize :refund_cents
end
