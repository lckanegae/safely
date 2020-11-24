class SecuredItemsController < ApplicationController
  def create
    @secured_item = SecuredItem.new(item_design_id: secured_item_params[:item_design_id])
    @secured_item.user = current_user
    secured_item_params[:subscriptions].each do |subscription_id|
      SecuredSubscription.create!(subscription_id: subscription_id, secured_item: @secured_item)
    end
    if @secured_item.save
      redirect_to profile_path, notice: "Insurance option created!"
    else
      redirect_to item_design_path(@secured_item.item_design)
    end
  end

  def update
    @secured_item = SecuredItem.find(params[:id])
    return unless @secured_item.user.id == current_user.id

    if @secured_item.activation_date.nil?
      @secured_item.activation_date = DateTime.now
    elsif DateTime.now.month == @secured_item.activation_date.month && DateTime.now.day == @secured_item.activation_date.day
      @secured_item.expiration_date = DateTime.now + 1.day
    else
      @secured_item.expiration_date = DateTime.now
    end
    @secured_item.save
  end

  def secured_item_params
    params.require(:secured_item).permit(:id, :item_design_id, subscriptions: [])
  end
end
