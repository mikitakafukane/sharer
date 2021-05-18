class ChatsController < ApplicationController
  before_action :authenticate_user!

  def create
    @chat = current_user.chats.new(chat_params)
    @chat.save
    @chats = Chat.where(room_id: @chat.room_id)
                 .order(created_at: :desc)
  end

  def destroy
    @chat = Chat.find(params[:id])
    @chat.destroy
    @chats = Chat.where(room_id: @chat.room_id)
                 .order(created_at: :desc)
  end

  private

  def chat_params
    params.require(:chat).permit(:content, :room_id)
  end
end
