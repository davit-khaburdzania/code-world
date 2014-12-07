class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.belongs_to :skill
      t.belongs_to :room
      t.boolean :status

      t.timestamps
    end
  end

  def drop
    drop_table :experiences
  end
end
