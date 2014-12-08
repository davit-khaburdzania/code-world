class QuizQuestionsController < ApplicationController
  before_action :authenticate_user!

  def create
    quiz = Quiz.find new_quiz_question_params[:room_id]
    quiz_question = QuizQuestion.new

    quiz_question.quiz = quiz
    quiz_question.title = new_quiz_question_params[:title]
    quiz_question.points_gained = new_quiz_question_params[:points_gained]
    quiz_question.save

    radio = params[:quiz_question][:radio].first.to_i

    quiz_question_answer1 = QuizQuestionAnswer.new
    quiz_question_answer2 = QuizQuestionAnswer.new
    quiz_question_answer3 = QuizQuestionAnswer.new
    quiz_question_answer4 = QuizQuestionAnswer.new

    quiz_question_answer1.text = new_quiz_question_params[:question_1]
    quiz_question_answer2.text = new_quiz_question_params[:question_2]
    quiz_question_answer3.text = new_quiz_question_params[:question_3]
    quiz_question_answer4.text = new_quiz_question_params[:question_4]

    quiz_question_answer1.is_correct=0
    quiz_question_answer2.is_correct=0
    quiz_question_answer3.is_correct=0
    quiz_question_answer4.is_correct=0

    case radio
    when 1
      quiz_question_answer1.is_correct=1 
    when 2
      quiz_question_answer2.is_correct=1
    when 3
      quiz_question_answer3.is_correct=1
    else 4
      quiz_question_answer4.is_correct=1 
    end

    quiz_question_answer1.save
    quiz_question_answer2.save
    quiz_question_answer3.save
    quiz_question_answer4.save

    quiz_question.quiz_question_answers << quiz_question_answer1
    quiz_question.quiz_question_answers << quiz_question_answer2
    quiz_question.quiz_question_answers << quiz_question_answer3
    quiz_question.quiz_question_answers << quiz_question_answer4

    quiz_question.save

    redirect_to edit_quiz_path(quiz)
  end

  private
  def new_quiz_question_params
    params.require(:quiz_question).permit(:room_id, :title, :points_gained, :radio, :question_1, :question_2, :question_3, :question_4)
  end
end