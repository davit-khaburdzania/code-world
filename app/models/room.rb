class Room < ActiveRecord::Base
  belongs_to :house
  belongs_to :user
  has_one :quiz
end
