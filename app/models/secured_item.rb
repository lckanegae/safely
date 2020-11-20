class SecuredItem < ApplicationRecord
  belongs_to :user
  belongs_to :item_design
  belongs_to :subscription
  before_update :calculate_price

  private

  def calculate_price
    unless self.expiration_date.nil?
      total_days = self.expiration_date - self.activation_date
      self.total_price_cents = total_days * self.subscription.price * 100
    end
  end
end
