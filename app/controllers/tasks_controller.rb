class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  helper_method :sort_column, :sort_direction
  PER = 10

  def index
    @tasks = current_user.tasks.order("#{sort_column} #{sort_direction}").page(params[:page]).per(PER)
    task = params[:task]
    if task.present?
      title = params[:task][:title]
      status = params[:task][:status]
      if title.present? && status.present?
        @tasks = @tasks.search_title_status(title, status)
      elsif title.present?
        @tasks = @tasks.search_title(title)
      elsif status.present?
        @tasks = @tasks.search_status(status)
      end
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to tasks_path, notice: 'タスクを新規作成しました'
    else
      flash.now[:alert] = 'タスクを作成できません'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'タスクを更新しました'
    else
      flash.now[:alert] = 'タスクを更新できません'
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: 'タスクを削除しました'
  end

  private
  def task_params
    params.require(:task).permit(:title, :content, :expired_at, :status).merge(priority: params[:task][:priority].to_i)
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'desc'
  end

  def sort_column
    Task.column_names.include?(params[:sort]) ? params[:sort] : 'id'
  end
end
