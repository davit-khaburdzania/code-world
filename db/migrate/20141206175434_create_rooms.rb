class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.belongs_to :house
      t.belongs_to :user
      t.string :title
      t.text :description
      t.text :base_layout_code
      t.text :viewer_test_layout_code
      t.boolean :video_enabled
      t.text :video_url
      t.text :quiz_base_layout_code
      t.text :quiz_question_code
      t.boolean :is_paid
      t.float :quiz_question_code
      
      t.timestamps
    end
  end
end
