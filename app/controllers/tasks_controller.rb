class TasksController < ApplicationController

  def index
    @task  = Task.new
    @q     = Task.ransack(params[:q])
    @tasks = @q.result(distinct: true)
               .where(user_id: current_user.id)
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.save
    redirect_to request.referer, notice: "タスクを登録しました"
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params)
    redirect_to request.referer, notice: "タスクを変更しました"
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to request.referer, notice: "タスク「#{task.title}」を削除しました"
  end

  def done
    @tasks = Task.all.includes(:user)
    @task  = Task.find(params[:id])
    @task.update(status: "完了")
  end

  private
  def task_params
    params.require(:task).permit(:title, :description, :status).merge(user_id: current_user.id)
  end

end
