class TasksController < ApplicationController
  before_action :authenticate_user!

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
    @q     = Task.ransack(params[:q])
    @tasks = @q.result(distinct: true)
               .where(user_id: current_user.id)
    @task = Task.new(task_params)
    if @task.save
      redirect_to request.referer, notice: "タスクを登録しました"
    else
      render :index
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: "タスクを変更しました"
    else
      render :edit
    end
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
