class ItemQuestionsController < ApplicationController

  before_action :authenticate_user!

  def show

  end

  def new
    @item_questions = ItemQuestion.all
    @item_question = ItemQuestion.new
  end

  def create
    item_question = ItemQuestion.new
 
    item_question.title = new_item_question_params[:title]
    item_question.save

    radio = params[:item_question][:radio].first.to_i

    item_question_answer1 = ItemAnswer.new
    item_question_answer2 = ItemAnswer.new
    item_question_answer3 = ItemAnswer.new
    item_question_answer4 = ItemAnswer.new

    item_question_answer1.text = new_item_question_params[:question_1]
    item_question_answer2.text = new_item_question_params[:question_2]
    item_question_answer3.text = new_item_question_params[:question_3]
    item_question_answer4.text = new_item_question_params[:question_4]

    item_question_answer1.is_correct=0
    item_question_answer2.is_correct=0
    item_question_answer3.is_correct=0
    item_question_answer4.is_correct=0

    case radio
    when 1
      item_question_answer1.is_correct=1 
    when 2
      item_question_answer2.is_correct=1
    when 3
      item_question_answer3.is_correct=1
    else 4
      item_question_answer4.is_correct=1 
    end

    item_question_answer1.save
    item_question_answer2.save
    item_question_answer3.save
    item_question_answer4.save

    item_question.item_answers << item_question_answer1
    item_question.item_answers << item_question_answer2
    item_question.item_answers << item_question_answer3
    item_question.item_answers << item_question_answer4

    item_question.save

    current_user.points += 10
    current_user.save

    redirect_to new_item_question_path(item_question)
  end

  private
  def new_item_question_params
    params.require(:item_question).permit(:title, :radio, :question_1, :question_2, :question_3, :question_4)
  end
end
