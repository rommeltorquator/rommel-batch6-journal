class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [ :show, :edit, :update, :destroy ]

  def index
    flash[:task_error] = nil
    @categories = current_user.categories.order(created_at: :desc)
    @page_title = "All Categories"
  end

  def show
    flash[:task_error] = nil
    @page_title = @category.title
    # @page_title = "tae"

    # @user = User.friendly.find(params[:id])
  end

  def new
    @category = current_user.categories.build
  end

  def create
    @category = current_user.categories.build(category_params)

    if @category.save
      redirect_to categories_path, notice: "A category was successfully added."
    else
      @categories = current_user.categories.order(created_at: :desc)
      flash[:task_error] = @category.errors.full_messages
      render 'categories/index'
    end
  end

  def edit
  end

  def update
    title = @category.title
    if @category.update(category_params)
      redirect_to @category, notice: "A category was successfully updated."
    else
      flash[:task_error] = @category.errors.full_messages
      @title = title
      render :show
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: "A category was successfully deleted."
  end

  private
  def set_category
    @category = current_user.categories.friendly.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title)
  end
end