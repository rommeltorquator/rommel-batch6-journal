class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = current_user.categories.order(created_at: :desc)
  end

  def show
    @category = current_user.categories.find(params[:id])
  end

  def new
    @category = current_user.categories.build
  end

  def create
    @category = current_user.categories.build(category_params)

    if @category.save
      redirect_to @category
    else
      render :new
    end
  end

  def edit
    @category = current_user.categories.find(params[:id])
  end

  def update
    @category = current_user.categories.find(params[:id])

    @category.update(category_params)
    redirect_to @category
  end

  private
  def category_params
    params.require(:category).permit(:title, :description)
  end
end