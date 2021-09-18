class CategoriesController < ApplicationController
  def new
    @category = Category.new
    @task = Task.new
  end

  def create
    @task = Task.new
    @categories = current_user.categories
    @category = Category.new(category_params)
    if @category.save
      redirect_to app_url
    else
      render :new
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to app_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :category, :user_id)
  end
end
