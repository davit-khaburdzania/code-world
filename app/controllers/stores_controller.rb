class StoresController < ApplicationController
  before_action :authenticate_user!

  def show
    @store = Store.find(params[:id])
    @items = Item.all
  end

  def new
    world = World.find(params[:world_id])
    place_id = params[:place_id]
    type_id = params[:type]

    store = Store.new
    store.user = current_user
    store.world = world
    store.place_id = place_id
    store.type_id = type_id
    store.title = "Health Store"
    store.save

    redirect_to world
  end

  def check_store_answer
    item = Item.find params[:item_id]
    store = Store.find params[:store_id]

    question = ItemQuestion.find params[:question_id]
    answer_id = params[:answer_id]
    current_answer = question.item_answers.find answer_id

    if current_answer.is_correct
      if store.type_id == 1
        current_user.health += item.health
        current_user.health = 100 if current_user.health > 100
      end
      current_user.save
      flash[:alert_success] = "Your answer is correct! You got item for free."
    else
      flash[:alert_danger] = "Your answer is not correct!"
    end

    redirect_to store
  end
end
