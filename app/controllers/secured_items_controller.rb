class SecuredItemsController < ApplicationController
  def create
    @secured_item = SecuredItem.new(secured_item_params)
    @secured_item.user = current_user
    if @secured_item.save
      redirect_to profile_path, notice: "secured_item created!"
    else
      render :new
    end
  end

  def update
    SecuredItem.find(params[:id])
  end

  def secured_item_params
    params.require(:secured_item).permit(:user_id, :item_design_id, :subscription_id, :activation_date, :expiration_date)
  end
end
