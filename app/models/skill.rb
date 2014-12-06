class Skill < ActiveRecord::Base
  has_and_belongs_to_many :users

  has_many :experiences
  has_many :rooms, :through => :experiences
end
