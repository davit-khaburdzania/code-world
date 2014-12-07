class CreateItemAnswers < ActiveRecord::Migration
  def change
    create_table :item_answers do |t|
      t.belongs_to :item_question
      t.string :text
      t.boolean :is_correct
      
      t.timestamps
    end
  end

  def drop
    drop_table :item_answers
  end
end
