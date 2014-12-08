class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :url
      t.belongs_to :item
      t.timestamps
    end
  end

  def drop
    drop_table :images
  end
end
