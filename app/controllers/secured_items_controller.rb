class SecuredItemsController < ApplicationController
  def create
    return if secured_item_params[:subscription_ids].nil?

    @secured_item = SecuredItem.new(secured_item_params)
    @secured_item.user = current_user

    if @secured_item.use_date == false
      @secured_item.expiration_date = nil
      @secured_item.activation_date = nil
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
    check_secured_item

    @secured_item = SecuredItem.find(params[:id])
    @secured_item.update(secured_item_params)
    redirect_to profile_path
  end

  def activate
    check_secured_item

    @secured_item.activation_date = DateTime.now
    @secured_item.save

    redirect_to profile_path(anchor: "user_item-#{@secured_item.id}"), notice: "Activated Item"
  end

  def deactivate
    check_secured_item

    if DateTime.now.to_date == @secured_item.activation_date.to_date
      @secured_item.expiration_date = DateTime.now + 1.day
    else
      @secured_item.expiration_date = DateTime.now
    end
    @secured_item.save

    redirect_to profile_path(anchor: "expired_item-#{@secured_item.id}"), notice: "Insurance Completed"
  end

  private

  def check_secured_item
    @secured_item = SecuredItem.find(params[:id])
    return unless @secured_item.user.id == current_user.id
  end

  def secured_item_params
    params.require(:secured_item).permit(:activation_date, :use_date, :expiration_date, :id, :item_design_id, subscription_ids: [])
  end
end
