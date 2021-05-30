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
    redirect_to categories_path
  end

  def edit    
  end

  # def update
  #   @task = Task.find(params[:id])

  #   @task.update(task_params)
  #   redirect_to task_path(@task)
  # end

  def destroy
    # @category = Category.find(params[:category_id])
    # @task = Task.find(params[:id])

    @task.destroy
    # redirect_to category_path(@category)
    redirect_to categories_path
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :deadline, :status)
  end
end