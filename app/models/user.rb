class User < ActiveRecord::Base
  has_and_belongs_to_many :badges
  has_and_belongs_to_many :skills
  has_and_belongs_to_many :item_questions, table_name: :item_questions_users

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
