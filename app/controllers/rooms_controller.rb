class RoomsController < ApplicationController

  before_action :authenticate_user!

  def index
  end

  def show
    @house = House.find params[:id]
    @rooms = @house.rooms
  end

  def new
    @house_id = params[:house_id]
    @room = Room.new
  end

  def create
    house = House.find(new_room_params[:house_id])
    room = Room.new

    room.user  = current_user
    room.house = house

    room.title = new_room_params[:title]
    room.description = new_room_params[:description]
    room.base_layout_code = new_room_params[:base_layout_code]
    room.viewer_layout_code = new_room_params[:viewer_layout_code]
    room.quiz_base_layout_code = new_room_params[:quiz_base_layout_code]
    room.quiz_question_code = new_room_params[:quiz_question_code]
    room.video_enabled = new_room_params[:video_enabled]
    room.video_url = "http://youtube.com" if new_room_params[:video_enabled] == 1
    room.is_paid = 0
    room.price = 0
    room.save

    current_user.points += 100
    current_user.health -= 15
    current_user.save

    redirect_to house
  end

  private
  def new_room_params
    params.require(:room).permit(:house_id, :video_enabled, :title, :description, :base_layout_code, :viewer_layout_code, :quiz_base_layout_code, :quiz_question_code)
  end
end
