class HousesController < ApplicationController

  before_action :authenticate_user!

  def index
  end

  def show
    @house = House.find params[:id]
    @rooms = @house.rooms

    base_layout = @house.base_layout_code
    lesson_layout = @house.lesson_list_layout_code
    lesson_list = ""

    @rooms.each do |room|
      lessons_str = lesson_layout
      lessons_str = lessons_str.gsub '%-link_to_lesson-%', '/lessons/'+room.id.to_s
      lessons_str = lessons_str.gsub '%-lesson_title-%', 'Lesson '+room.title
      lesson_list += lessons_str
    end

    @room_html_code = base_layout.gsub '%-lesson_layout-%', lesson_list
  end

  def new
    @place_id = params[:place_id]
    @world_id = params[:world_id]
    @house = House.new
  end

  def create
    world = World.find(new_house_params[:world_id])
    house = House.new

    house.user  = current_user
    house.world = world

    house.title = new_house_params[:title]
    house.place_id = new_house_params[:place_id]
    house.base_layout_code = new_house_params[:base_layout_code]
    house.lesson_list_layout_code = new_house_params[:lesson_list_layout_code]
    house.place_id = new_house_params[:place_id]
    house.img = "house_1.png"

    house.save

    current_user.points += 100
    current_user.health -= 10
    current_user.save

    redirect_to world
  end


  private
  def new_house_params
    params.require(:house).permit(:title, :base_layout_code, :lesson_list_layout_code, :place_id, :world_id)
  end
end
