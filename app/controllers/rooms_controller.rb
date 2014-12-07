class RoomsController < ApplicationController

  before_action :authenticate_user!

  def index
  end

  def show
    @house = House.find params[:id]
    @rooms = @house.rooms

    # lesson_layout = @house.lesson_list_layout_code
    # base_layout = @house.base_layout_code
    base_layout = "<div style='width:200px; height: 400px; border: 1px solid black; background: green;'>%-lesson_layout-%</div>"
    lesson_layout = "<a href='%-link_to_lesson-%'>%-lesson_title-%</a></br>"
    lesson_list = ""

    # @rooms.each do |room|
    #  lessons_str = lesson_layout.gsub '%-link_to_lesson-%', '/lessons/1'
    #  lessons_str = lessons_str.gsub! '%-lesson_title-%', 'Lesson 1'
    #  lesson_list += lessons_str
    # end
      
    (1..10).each do |room|
      lessons_str = lesson_layout
      lessons_str = lessons_str.gsub '%-link_to_lesson-%', '/lessons/'+room.to_s
      lessons_str = lessons_str.gsub '%-lesson_title-%', 'Lesson '+room.to_s
      lesson_list += lessons_str
    end

    @room_html_code = base_layout.gsub '%-lesson_layout-%', lesson_list
  end

  def new
    @house_id = params[:house_id]
    @room = Room.new
  end

  def create
    house = House.find(new_house_params[:house_id])
    room = Room.new

    room.user  = current_user
    room.house = house

    room.title = new_house_params[:title]
    room.place_id = new_house_params[:place_id]
    room.base_layout_code = new_house_params[:base_layout_code]
    room.lesson_list_layout_code = new_house_params[:lesson_list_layout_code]
    room.place_id = new_house_params[:place_id]

    room.save

    redirect_to world
  end

  private
  def new_room_params
    params.require(:house).permit(:title, :base_layout_code, :lesson_list_layout_code, :place_id, :world_id)
  end
end
