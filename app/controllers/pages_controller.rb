class PagesController < ApplicationController
  def home

  end

  def profile
    @user = current_user
    @secured_items = Secured_item.where(user: current_user)
  end

  def edit
  end
end
