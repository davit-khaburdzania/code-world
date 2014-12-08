class BadgesController < ApplicationController
  def index
  end

  def new
    badge_id = params[:badge_id]
    current_user.badges.delete_all 

    badge = Badge.find badge_id
    current_user.badges << badge
    redirect_to root_path 
  end
end
