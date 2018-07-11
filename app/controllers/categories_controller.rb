class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.create(category_params)
    if category.save
      redirect_to category_path(category)
    else
      redirect_to new_category_path
    end
  end

  def show
    @category = Category.find(params[:id])
    if @category.save
    else
    end
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
