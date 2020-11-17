class ItemDesignsController < ApplicationController
  def show
    @item_design = ItemDesign.find(params[:id])
    @subscriptions = Subscription.where(item_design: @item_design)
  end

  def index
    @item_designs = ItemDesign.all
  end
end
