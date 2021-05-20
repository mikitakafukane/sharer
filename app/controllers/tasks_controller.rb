class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @task  = Task.new
    @q     = Task.ransack(params[:q])
    @tasks = @q.result(distinct: true)
               .where(user_id: current_user.id)
               .order(created_at: :desc)

  end

  def new
    @task = Task.new
  end

  def create
    @q     = Task.ransack(params[:q])
    @tasks = @q.result(distinct: true)
               .where(user_id: current_user.id)
               .order(created_at: :desc)

    @task  = Task.new(task_params)
    if @task.save
      flash[:success] = "タスクを登録しました"
      redirect_to request.referer
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
      flash[:success] = "タスクを更新しました"
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    flash[:danger] = "タスク「#{task.title}」を削除しました"
    redirect_to request.referer
  end

  def done
    @tasks = Task.where(user_id: current_user.id)
    @task  = Task.find(params[:id])
    @task.update(status: "完了")
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :status).merge(user_id: current_user.id)
  end
end
