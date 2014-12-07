class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name
      t.integer :points, default: 100
      t.float :health, default: 100

      t.timestamps
    end
  end
  
  def drop
    drop_table :users
  end
end
