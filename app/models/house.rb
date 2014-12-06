class House < ActiveRecord::Base
  has_many :rooms
  belongs_to :world
  belongs_to :user
end
