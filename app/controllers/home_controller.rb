class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:app]
  def index
    redirect_to app_path if user_signed_in?
  end

  def app
    @task = Task.new
    @category = Category.new
    @categories = Category.all
    if params[:category]
      @category = Category.find_by(name: params[:category])
      @tasks = @category.tasks.order(created_at: :desc)
    elsif params[:id] == '0'
      @tasks = Task.where(category_id: nil).order(created_at: :desc)
    else
    @tasks = Task.all.order(created_at: :desc)
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
end
