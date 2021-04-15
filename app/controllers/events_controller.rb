class EventsController < ApplicationController
  def index
    @events = Event.all
  end
  
  def new
    @event = Event.new
  end
  
  def create
    Event.create(event_params)
    redirect_to events_path
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    event = Event.find(params[:id])
    event.update!(event_params)
    redirect_to events_path, notice: "イベントを変更しました"
  end
  
  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to events_path, notice: "イベント「#{event.title}」を削除しました"
  end
  
  
  private
  def event_params
    params.require(:event).permit(:title, :description, :start_date, :end_date)
  end
end
