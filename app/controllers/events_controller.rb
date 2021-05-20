class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @event = Event.new
    @events = Event.all
    @q = Task.ransack(params[:q])
    @tasks = @q.result(distinct: true).
      where(user_id: current_user.id)
  end

  def create
    @events = Event.all
    @event = current_user.events.new(event_params)
    if @event.save
      redirect_to events_path
    else
      render :index
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:success] = "イベントを変更しました"
      redirect_to events_path
    else
      render :edit
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    flash[:danger] = "イベント「#{event.title}」を削除しました"
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :start_date, :end_date)
  end
end
