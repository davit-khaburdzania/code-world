class WorldsController < ApplicationController

  before_action :authenticate_user!

  def index

    if current_user.badges.count == 0
      badge = Badge.find 1
      current_user.badges << badge
      current_user.save
    end

    @worlds = World.all
  end

  def show
    @world = World.find params[:id]
    @houses = @world.houses
    @stores = @world.stores
  end
end
