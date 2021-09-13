class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:app]
  def index
    redirect_to app_path if user_signed_in?
  end

  def app
    @task = Task.new
    @tasks = Task.all
    @category = Category.new
    @categories = Category.all
  end
end
