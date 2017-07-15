class CategoriesController < ApplicationController
  before_action :find_categroy, only: [:show]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    else
      redirect_to new_category_path
    end
  end

  def show
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

  def find_categroy
    @category = Category.find(params[:id])
  end
end
