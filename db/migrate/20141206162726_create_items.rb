class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.belongs_to :store
      t.string :title
      t.float :price
      t.float :health
      t.integer :image_id

      t.timestamps
    end
  end

  def drop
    drop_table :items
  end
end
