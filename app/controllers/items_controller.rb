class ItemsController < ApplicationController
  def buy
    item = Item.find params[:item_id]
    user = current_user

    if user.points < item.price
      flash[:alert_danger] = "You don't have enough points to buy #{item.title}"
    else 
      user.points = user.points - item.price
      user.health = user.health + item.health
      user.health = 100 if user.health > 100

      user.save
      flash[:alert_success] = "You have successfully bought #{item.title}"
    end

    redirect_to :back
  end
end
