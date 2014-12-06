class QuizQuestion < ActiveRecord::Base
  belongs_to :quiz
  has_many :quiz_question_answers
end
