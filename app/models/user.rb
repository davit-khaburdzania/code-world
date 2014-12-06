class User < ActiveRecord::Base
  has_and_belongs_to_many :badges
  has_and_belongs_to_many :skills

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
