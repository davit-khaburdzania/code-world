module HouseHelper
  def has_badge user_badges, badge 
    user_badges.select { |b| b.id == badge }.first
  end
end
