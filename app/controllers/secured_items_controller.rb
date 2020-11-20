class SecuredItemsController < ApplicationController
  def create
    @secured_item = SecuredItem.new(secured_item_params)
    @secured_item.user = current_user
    if @secured_item.save
      redirect_to profile_path, notice: "Insurance option created!"
    else
      render :new
    end
  end

  def update
    @secured_item = SecuredItem.find(params[:id])
    return false unless @secured_item.user.id == current_user.id

    if @secured_item.activation_date.nil?
      @secured_item.activation_date = DateTime.now
      @secured_item.save
    elsif DateTime.now.month == @secured_item.activation_date.month && DateTime.now.day == @secured_item.activation_date.day
      @secured_item.expiration_date = DateTime.now + 1.day
      @secured_item.save
    else
      @secured_item.expiration_date = DateTime.now
      @secured_item.save
    end
  end

  def secured_item_params
    params.require(:secured_item).permit(:id, :user_id, :item_design_id, :subscription_id)
  end
end
