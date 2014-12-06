class Room < ActiveRecord::Base
  belongs_to :house
  belongs_to :user
  has_one :quiz

  has_many :experiences
  has_many :skills, :through => :experiences

end
