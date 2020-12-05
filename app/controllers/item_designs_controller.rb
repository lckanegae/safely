class ItemDesignsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def show
    @item_design = ItemDesign.find(params[:id])
    @secured_item = SecuredItem.new
    @secured_item.item_design = @item_design
    @subscriptions = Subscription.where(item_design: @item_design)
  end

  def index
    if params[:search].present?
      items_query = "name ILIKE :search OR item_type ILIKE :search"
      @items = ItemDesign.where(items_query, search: "%#{params[:search]}%")
    elsif params[:item_type].present?
      @items = ItemDesign.where(item_type: params[:item_type]) 
    else
      @items = ItemDesign.all
    end
  end

  def spending_math
    time_spending = (secured_items.expiration_date - secured_items.activation_date)
    total_price = time_spending * subscription.price
    return total_price
  end
end
