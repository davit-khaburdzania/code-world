class Quiz < ActiveRecord::Base
  belongs_to :room
  has_many :quiz_questions
end
