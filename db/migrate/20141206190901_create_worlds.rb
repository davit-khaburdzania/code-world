class CreateWorlds < ActiveRecord::Migration
  def change
    create_table :worlds do |t|
      t.string :name

      t.timestamps
    end
  end

  def drop
    drop_table :worlds
  end
end
