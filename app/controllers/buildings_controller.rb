class BuildingsController < ApplicationController
  def new
    @world_id = params[:world_id]
    @place_id = params[:place_id]
  end
end
