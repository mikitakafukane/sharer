class RoomsController < ApplicationController

  def index
    @rooms = Room.all
  end
  
  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path, notice: 'ルームを作成しました'
    else
      render :new
    end
  end
  
  def show
    @room = Room.find(params[:id])
    @belonging = Room.find_by(room_id: room.id)
  end
  
  def edit
    @room = Room.find(params[:id])
  end
  
  def update
    if room = Room.find(params[:id])
      room.update!(room_params)
      redirect_to rooms_path, notice: 'グループを更新しました'
    else
      render :edit
    end
  end
  
  private
  def room_params
    params.require(:room).permit(:name)
  end
  
end
