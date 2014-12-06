class Experience < ActiveRecord::Base
  belongs_to :skill
  belongs_to :room
end
