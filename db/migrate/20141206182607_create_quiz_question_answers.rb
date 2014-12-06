class CreateQuizQuestionAnswers < ActiveRecord::Migration
  def change
    create_table :quiz_question_answers do |t|
      t.belongs_to :quiz_question
      t.text :text
      t.boolean :is_correct

      t.timestamps
    end
  end
end
