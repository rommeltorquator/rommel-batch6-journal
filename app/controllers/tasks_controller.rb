class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(id: :desc)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def create
    @category = Category.find(params[:category_id])
    @task = @category.tasks.create(task_params)

    redirect_to categories_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])

    @task.destroy
    redirect_to root_path
  end

  private
  def task_params
    params.require(:task).permit(:title, :description, :deadline, :category_id)
  end
end