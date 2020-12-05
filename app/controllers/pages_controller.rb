class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @top_five_items = SecuredItem.group(:item_design).order(count: :desc).limit(5).count
  end

  def profile
    all_user_items = SecuredItem.where(user: current_user)

    @expired = all_user_items.select do |user_item|
      if user_item.expiration_date
        unless user_item.expiration_date.to_date.future?
          user_item
        end
      end
    end

    @currently = all_user_items.select do |user_item|
      if user_item.activation_date || (user_item.activation_date && user_item.expiration_date.past?)
        user_item
      end
    end

    @currently = @currently - @expired

    @item_designs = []
    @expired.each do |item|
      @expired.each do |sec_item|
        @item_designs << sec_item.item_design.name unless @item_designs.include?(sec_item.item_design.name)
      end
    end

    @item_designs.map! do |item_name|
      ItemDesign.find_by(name: item_name)

    end

    @activate = all_user_items - @currently - @expired
  end
end
