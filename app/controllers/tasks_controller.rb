class TasksController < ApplicationController
  before_action :set_task, only: [ :edit, :destroy ]
  # def index
  #   @tasks = Task.all.order(id: :desc)
  # end

  # def show
  #   @task = Task.find(params[:id])
  # end

  # def new
  #   @task = Task.new
  # end

  def create
    category = Category.find(params[:category_id])
    @task = category.tasks.create(task_params)

    # redirect_to category_path(category)
    redirect_to categories_path, notice: "A task was successfully added."
  end

  # def edit
  # end

  def update
    category = Category.find(params[:category_id])
    @task = category.tasks.find(params[:id]).update(task_params)    

    # @task.update(task_params)
    # redirect_to task_path(@task)
    # redirect_to categories_path
    redirect_to category_path(category), notice: "A task was successfully updated."
  end

  def destroy
    @category = Category.find(params[:category_id])
    # @task = Task.find(params[:id])

    @task.destroy
    redirect_to category_path(@category), notice: "A task was successfully deleted."
    # redirect_to categories_path
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :deadline, :status)
  end
end