class TasksController < ApplicationController
  before_action :set_task, only: [ :edit, :destroy ]
  before_action :set_category, only: [ :create, :update, :destroy, :create2 ]

  def create
    flash[:task_error] = nil
    @task = @category.tasks.create(task_params)

    if @task.save
      redirect_to categories_path, notice: "A task was successfully added."
    else
      flash[:task_error] = @task.errors.full_messages

      render '/categories/show'
    end
  end

  def create2
    flash[:task_error] = nil
    @task = @category.tasks.create(task_params)

    if @task.save
      redirect_to category_path(@category), notice: "A task was successfully added."
    else
      flash[:task_error] = @task.errors.full_messages

      render 'categories/show'
    end
  end

  def update
    flash[:task_error] = nil
    @task = @category.tasks.find(params[:id])

    if @task.update(task_params) 
      redirect_to category_path(@category), notice: "A task was successfully updated."
    else
      flash[:task_error] = @task.errors.full_messages
      render 'categories/show/'
    end
  end

  def destroy
    @task.destroy
    redirect_to category_path(@category), notice: "A task was successfully deleted."
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:category_id])   
  end

  def task_params
    params.require(:task).permit(:title, :description, :deadline, :status, :category_id)
  end
end