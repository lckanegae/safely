class PagesController < ApplicationController
  def home
    @top_five_items = SecuredItem.group(:item_design).order(count: :desc).limit(5).count
  end

  def profile
    all_user_items = SecuredItem.where(user: current_user)
    @expired_items = all_user_items.select do |user_item|
      unless user_item.expiration_date.nil?
        user_item
      end
    end
    @user_items = all_user_items - @expired_items
  end
end
