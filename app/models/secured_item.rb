class SecuredItem < ApplicationRecord
  belongs_to :user
  belongs_to :item_design
  has_many :secured_subscriptions
  has_many :subscriptions, through: :secured_subscriptions
  before_update :calculate_price
  monetize :total_price_cents

  private

  def calculate_price
    return if self.expiration_date.nil?

    total_days = self.expiration_date - self.activation_date
    subscription_total = SecuredSubscription.where(secured_item: self).map do |secured_subscription|
      secured_subscription.subscription.price
    end
    self.total_price_cents = total_days * subscription_total.sum * 100
  end
end
