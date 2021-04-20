class TasksController < ApplicationController

  def index
    @tasks = Task.where(user_id: current_user.id)
    # @tasks = Task.all.includes(:user)
    @task = Task.new
    @q = Task.ransack(params[:q])
    @tasks_search = @q.result(distinct: true)
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.save
    redirect_to tasks_path, notice: "タスクを登録しました"
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params)
    redirect_to tasks_path, notice: "タスクを変更しました"
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to tasks_path, notice: "タスク「#{task.title}」を削除しました"
  end

  def done
    @task = Task.find(params[:id])
    @task.update(status: "完了")
    @tasks = Task.all.includes(:user)
  end

  private
  def task_params
    params.require(:task).permit(:title, :description, :end_date, :status).merge(user_id: current_user.id)
  end

end
