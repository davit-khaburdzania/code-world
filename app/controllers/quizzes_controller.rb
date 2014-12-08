class QuizzesController < ApplicationController

  before_action :authenticate_user!

  def show
    @quiz = Quiz.find params[:id]
    questions_passed = Array.new
    if session[:questions_passed]
      questions_passed = session[:questions_passed]
      @quiz_question = @quiz.quiz_questions.where('id not in (?)', questions_passed).first 
    else
      @quiz_question = @quiz.quiz_questions.first
    end

    if session[:questions_passed] && !@quiz_question
      barier = @quiz.barier
      total_points = session[:total_points]
      correct_count = session[:correct_count]
      incorrect_count = session[:incorrect_count]

      if total_points >= barier
        current_user.points += 100
        current_user.health -= 10

        @html = "<h1> You successfully passed the quiz<h1>"
        @html += "Correct Answers: " + correct_count.to_s
        @html += "<br>Incorrect Answers: " + incorrect_count.to_s
        @html += "<br>Total Score: " + total_points.to_s
        @html += "<hr>"
        @html += "<a href='/'>Go Back To Worlds</a>"
      else
        current_user.health -= 10

        @html = "<h1> Quiz failed <h1>"
        @html += "Correct Answers: " + correct_count.to_s
        @html += "<br>Incorrect Answers: " + incorrect_count.to_s
        @html += "<br>Total Score: " + total_points.to_s
        @html += "<hr>"
        @html += "<a href='/'>Go Back To Worlds</a>"

      end
        session.delete(:questions_passed)
        session.delete(:total_points)
        session.delete(:correct_count)
        session.delete(:incorrect_count)
    else
      base_layout_code = @quiz.room.quiz_base_layout_code
      question_code = @quiz.room.quiz_question_code

      question_html = question_code.gsub '%-quiz_question_title-%', @quiz_question.title

      @quiz_question.quiz_question_answers.each_with_index do |ans, index|
        question_tag = '%-answer_' << (index+1).to_s << '-%'
        radiobtn_str = "<input type='radio' name='answer_id' value='" << ans.id.to_s << "'> " << ans.text
        single_question = 
        question_html = question_html.gsub question_tag, radiobtn_str
      end

      question_html = "<form action='/check-answer' method='get'>" << question_html
      question_html += "<input type='hidden' name='question_id' value='" << @quiz_question.id.to_s << "'>"
      question_html += "</br><input type='submit' value='Submit'></form>"

      @html = base_layout_code.gsub '%-quiz_question_layout-%', question_html
    end
  end

  def new
    @room_id = params[:room_id]
    @quiz = Quiz.new
  end

  def edit
    @quiz = Quiz.find params[:id]
    @quis_question = QuizQuestion.new
  end

  def create
    room = Room.find new_quiz_params[:room_id]
    quiz = Quiz.new

    quiz.room = room
    quiz.title = new_quiz_params[:title]
    quiz.barier = new_quiz_params[:barier]
    quiz.save

    redirect_to edit_quiz_path quiz
  end

  def check_answer
    question = QuizQuestion.find params[:question_id]
    answer_id = params[:answer_id]
    current_answer = question.quiz_question_answers.find answer_id

    if session[:questions_passed]
      questions_passed = session[:questions_passed]
      total_points = session[:total_points]
      correct_count = session[:correct_count]
      incorrect_count = session[:incorrect_count]
    else
      questions_passed = Array.new
      total_points = 0
      correct_count = 0
      incorrect_count = 0
    end

    if current_answer.is_correct
      total_points += question.points_gained
      correct_count += 1
    else
      incorrect_count += 1
    end

    questions_passed << question.id
    
    session[:questions_passed] = questions_passed
    session[:total_points] = total_points
    session[:correct_count] = correct_count
    session[:incorrect_count] = incorrect_count

    # other_q = question.quiz_question_answers.where('id not in (?)', answers)

    redirect_to question.quiz
  end

  private
  def new_quiz_params
    params.require(:quiz).permit(:title, :barier, :room_id)
  end
end
