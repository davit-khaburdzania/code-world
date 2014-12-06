class ItemQuestion < ActiveRecord::Base
  has_and_belongs_to_many :users, table_name: :item_questions_users
  belongs_to :item
  has_many :item_answers
end
