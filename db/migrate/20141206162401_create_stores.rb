class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.belongs_to :user
      t.belongs_to :world
      
      t.string :title
      t.integer :place_id
      t.integer :type_id

      t.timestamps
    end
  end

  def drop
    drop_table :stores
  end
end
