class CreateBadgeTable < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :name

      t.timestamps
    end

    create_table :badges_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :badge
    end
  end

  def drop
    drop_table :badges
    drop_table :badges_users
  end
end
