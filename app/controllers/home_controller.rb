class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:app]
  def index
    redirect_to app_path if user_signed_in?
  end

  def app
    @task = Task.new
    @category = Category.new
    @categories = Category.where(user_id: current_user.id)
    if params[:category]
      @category = Category.where(user_id: current_user.id).find_by(name: params[:category])
      @tasks = @category.tasks.order(created_at: :desc)
    elsif params[:no_category] == 'true'
      @tasks = Task.where(category_id: nil).where(user_id: current_user.id).order(created_at: :desc)
      @category = nil
    else
      @tasks = Task.where(user_id: current_user.id).order(created_at: :desc)
    end

    respond_to do |format|
      format.html
      format.js
    end
  end
end
