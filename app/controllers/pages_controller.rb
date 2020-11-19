class PagesController < ApplicationController
  def home
    @top_five_items = SecuredItem.group(:item_design).order(count: :desc).limit(5).count
  end

  def profile
    @user_items = SecuredItem.where(user: current_user)
    @expired_item_designs = @user_items.map do |user_item|
      unless user_item.expiration_date.nil?
        user_item.item_design if user_item.expiration_date < Time.current
      end
    end
    @expired_item_designs = @expired_item_designs.uniq
  end
end
