class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:app]
  def index
    redirect_to app_path if user_signed_in?
  end

  def app
    @task = Task.new
    @category = Category.new
    @categories = current_user.categories
    if params[:category]
      @category = current_user.categories.find_by(name: params[:category])
      @tasks = @category.tasks.not_archived.order(created_at: :desc)
    elsif params[:no_category] == 'true'
      @tasks = current_user.tasks.not_archived.where(category_id: nil).order(created_at: :asc)
      @category = nil
    else
      @tasks = current_user.tasks.not_archived.order(status: :desc, created_at: :desc)
    end

    respond_to do |format|
      format.html
      format.js
    end
  end
end
