class CreateQuizQuestions < ActiveRecord::Migration
  def change
    create_table :quiz_questions do |t|
      t.belongs_to :quiz
      t.string :title
      t.integer :points_gained

      t.timestamps
    end
  end
end
