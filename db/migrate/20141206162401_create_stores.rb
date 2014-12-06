class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.belongs_to :user
      t.string :title
      t.integer :place_id

      t.timestamps
    end
  end
end
