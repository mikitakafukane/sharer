class RoomsController < ApplicationController
  before_action :authenticate_user!
  # layout 'room', except: [:index, :new]

  def index
    @room  = Room.new
    @rooms = current_user.rooms
  end

  def create
    @rooms = Room.all
    @room  = Room.new(room_params)
    if @room.save
      flash[:success] = "ルームを作成しました"
      redirect_to @room
    else
      render :index
    end
  end

  def show
    @room = Room.find(params[:id])

    @post     = Post.new
    @posts    = Post.where(user_id: @room.users.ids)

    @chat     = Chat.new(room_id: @room.id)
    @chats    = @room.chats

    @comment  = Comment.new
    @comments = @post.comments
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    room = Room.find(params[:id])
    if room.update(room_params)
      redirect_to rooms_path, notice: 'グループを更新しました'
    else
      render :edit
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
end
