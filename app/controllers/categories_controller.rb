class CategoriesController < ApplicationController
  before_action :find_categroy, only: [:show, :edit, :update]

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

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to @category
    else
      redirect_to edit_category_path(@category)
    end
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

  def find_categroy
    @category = Category.find(params[:id])
  end
end
