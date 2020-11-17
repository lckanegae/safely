class ItemDesignsController < ApplicationController
  def show
    @item_design = ItemDesign.find(params[:id])
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
