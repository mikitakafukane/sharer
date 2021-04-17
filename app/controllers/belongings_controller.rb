class BelongingsController < ApplicationController
  def index
    @room = Room.find(params[:room_id])
    @users = User.all
  end
end
