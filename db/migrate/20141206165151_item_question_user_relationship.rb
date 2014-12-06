class ItemQuestionUserRelationship < ActiveRecord::Migration
  def change
    create_table :item_questions_users do |t|
      t.belongs_to :user
      t.belongs_to :item_question      
    end
  end
end
