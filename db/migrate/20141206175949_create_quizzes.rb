class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.belongs_to :room
      t.string :title
      t.integer :barier

      t.timestamps
    end
  end

  def drop
    drop_table :quizzes
  end
end
