class CategoriesController < ApplicationController
  def new
    @category = Category.new
    @task = Task.new
  end

  def create
    @task = Task.new
    @categories = Category.all
    @category = Category.new(category_params)
    if @category.save
      redirect_to app_url
    else
      render :new
    end
  end

  def show
    if params[:id] == 0
      @tasks = Task.where(category_id: nil)
    else
      category = Category.find(params[:id])
      @tasks = category.tasks
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
