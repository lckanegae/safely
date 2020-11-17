class ItemDesignsController < ApplicationController
  def show
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
