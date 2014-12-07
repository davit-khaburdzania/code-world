class TutorialsController < ApplicationController

  before_action :authenticate_user!

  def show
    @house = House.find params[:id]
    @rooms = @house.rooms
  end

end
