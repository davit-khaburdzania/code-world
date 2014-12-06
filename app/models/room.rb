class Room < ActiveRecord::Base
  belongs_to :house
  has_one :quiz
end
