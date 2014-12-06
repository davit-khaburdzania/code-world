class Item < ActiveRecord::Base
  belongs_to :store
  has_one :image
  has_many :item_questions
end
