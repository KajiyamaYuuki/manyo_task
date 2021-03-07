class TasksController < ApplicationController
  before_action :set_task, only: %i[show, edit]
  def index
    @task = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path, notice: 'タスクを新規作成しました'
    else
      flash.now[:alert] = 'タスクを作成できません'
      render :new
    end
  end

  def show; end

  def edit; end

  private

  def task_params
    params.require(:task).permit(:title, :content)
  end

  def set_task
    @task = Task.find([:id])
  end
end
