class User < ActiveRecord::Base
  has_one :badge
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
