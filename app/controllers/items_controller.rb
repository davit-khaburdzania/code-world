class ItemsController < ApplicationController
  def buy
    item = Item.find params[:item_id]
    store = Item.find params[:store_id]
    user = current_user

    if user.points < item.price
      flash[:alert_danger] = "You don't have enough points to buy #{item.title}"
    else 
      store.user.points += item.price;
      user.points = user.points - item.price
      user.health = user.health + item.health
      user.health = 100 if user.health > 100

      user.save
      store.user.save
      
      flash[:alert_success] = "You have successfully bought #{item.title}"
    end

    redirect_to :back
  end

  def free
    @item = Item.find params[:item_id]
    @store_id = params[:store_id]

    offset = rand(ItemQuestion.count)

    @item_question = ItemQuestion.offset(offset).first

    # render :json => @item_question.item_answers
    render "item_questions/free"
  end
end
