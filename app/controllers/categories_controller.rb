class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [ :show, :edit, :update, :destroy ]

  def index
    @categories = current_user.categories.order(created_at: :desc)
  end

  def show    
  end

  def new
    @category = current_user.categories.build
  end

  def create
    @category = current_user.categories.build(category_params)

    if @category.save
      redirect_to categories_path, notice: "A category was successfully added."
    else
      render :new
    end
  end

  def edit
  end

  def update
    @category.update(category_params)
    redirect_to @category, notice: "A category was successfully updated."
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: "A category was successfully deleted."
  end

  private
  def set_category
    @category = current_user.categories.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title)
  end
end