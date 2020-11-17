class ItemDesign < ApplicationRecord
  include PgSearch::Model
  
  has_many :secured_items

  monetize :refund_cents

  scope :sorted, ->{ order(name: :asc) }

  pg_search_scope :search, against: [ :name, :item_type ],
    using: {
      tsearch: {prefix: true}
    }

end
