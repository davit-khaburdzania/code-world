class CreateItemQuestions < ActiveRecord::Migration
  def change
    create_table :item_questions do |t|
      t.string :title
      t.float :sale

      t.timestamps
    end
  end

  def drop
    drop_table :item_questions
  end
end
