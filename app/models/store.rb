class Store < ActiveRecord::Base
  has_many :item
  belongs_to :world
end
