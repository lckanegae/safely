class SecuredItemsController < ApplicationController
  def create
    return if secured_item_params[:subscriptions].nil?

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

  def edit
    @secured_item = SecuredItem.find(params[:id])
  end

  def update
    @secured_item = SecuredItem.find(params[:id])
    @secured_item.update(secured_item_params)
    redirect_to profile_path
  end

  def activate
    check_secured_item

    @secured_item.activation_date = DateTime.now
    @secured_item.save

    redirect_to profile_path, notice: "Activated Item", anchor: "user_item-#{@secured_item.id}"
  end

  def deactivate
    check_secured_item

    if DateTime.now.to_date == @secured_item.activation_date.to_date
      @secured_item.expiration_date = DateTime.now + 1.day
    else
      @secured_item.expiration_date = DateTime.now
    end
    @secured_item.save

    redirect_to profile_path, notice: "Insurance Completed", anchor: "expired_item-#{@secured_item.id}"
  end

  private

  def check_secured_item
    @secured_item = SecuredItem.find(params[:id])
    return unless @secured_item.user.id == current_user.id
  end

  def secured_item_params
    params.require(:secured_item).permit(:activation_date, :expiration_date, :id, :item_design_id, subscriptions: [])
  end
end
