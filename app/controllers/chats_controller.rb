class ChatsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
    rooms = current_user.belongings.pluck(:room_id)
    belongings = Belonging.find_by(user_id: @user.id, room_id: rooms)

    unless belongings.nil?
      @room = belongings.room
    else
      @room = Room.new
      @room.save
      Belonging.create(user_id: current_user.id, room_id: @room.id)
      Belonging.create(user_id: @user.id, room_id: @room.id)
    end
    @chats = @room.chats
    @chat  = Chat.new(room_id: @room.id)
  end

  def create
    @chat = current_user.chats.new(chat_params)
    @chat.save
    redirect_to request.referer
  end

  def destroy
    @chat = Chat.find(params[:id])
    @chat.destroy
    redirect_to request.referer, notice: "チャット「#{@chat.content}」を削除しました"
  end

  private

  def chat_params
    params.require(:chat).permit(:content, :room_id)
  end

end
