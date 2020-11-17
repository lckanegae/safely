class PagesController < ApplicationController
  def home
    @top_five_items = SecuredItem.group(:item_design).order(count: :desc).limit(5).count
  end
end
