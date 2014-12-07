class WorldsController < ApplicationController

  before_action :authenticate_user!

  def index
    @worlds = World.all
  end

  def show
    @world = World.find params[:id]
    @houses = @world.houses
    @stores = @world.stores
  end
end
