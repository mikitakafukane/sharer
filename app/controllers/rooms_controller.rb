class RoomsController < ApplicationController
# layout 'room', except: [:index, :new]

  def index
    @rooms = Room.all.order(updated_at: :desc)
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save!
      redirect_to @room, notice: 'ルームを作成しました'
    else
      render :new
    end
  end

  def show
    @room     = Room.find(params[:id])
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
    params.require(:room).permit(:name, user_ids: [] )
  end

end
