class World < ActiveRecord::Base
  has_many :houses
  has_many :stores
end
