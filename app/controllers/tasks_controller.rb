class TasksController < ApplicationController
  before_action :set_task, only: %i[destroy]

  def index
    @tasks = current_user.tasks.recent
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to tasks_path, success: "タスクを登録しました"
    else
      flash.now[:warning] = "タスクの登録に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, success: "タスクを削除しました"
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
