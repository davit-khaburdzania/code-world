class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.belongs_to :user
      t.belongs_to :world

      t.integer :place_id
      t.string :title
      t.string :img
      t.text :base_layout_code
      t.text :lesson_test_layout_code

      t.timestamps
    end
  end
end
