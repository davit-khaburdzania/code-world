class Item < ActiveRecord::Base
  belongs_to :store
  has_one :image
end
