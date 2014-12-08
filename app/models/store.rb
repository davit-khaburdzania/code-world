class Store < ActiveRecord::Base
  has_many :items
  belongs_to :world
  belongs_to :user
end
