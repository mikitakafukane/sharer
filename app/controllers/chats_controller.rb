class ChatsController < ApplicationController
  before_action :authenticate_user!

  def create
    @chat = current_user.chats.new(chat_params)
    @chat.save
    @chats = Chat.where(room_id: @chat.room_id)
                 .order(created_at: :desc)
    # redirect_to request.referer
  end

  def destroy
    @chat = Chat.find(params[:id])
    @chat.destroy
    # redirect_to request.referer, notice: "チャット「#{@chat.content}」を削除しました"
    @chats = Chat.where(room_id: @chat.room_id)
                 .order(created_at: :desc)
  end

  private

  def chat_params
    params.require(:chat).permit(:content, :room_id)
  end
end
