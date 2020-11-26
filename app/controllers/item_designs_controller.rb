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
    else
      @items = ItemDesign.all
    end
  end
end
