class TasksController < ApplicationController
  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @categories = Category.all
    if @task.save
      redirect_to app_url
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
    @categories = Category.all
  end

  def update
    @task = Task.find(params[:id])
    @categories = Category.all
    if @task.update(task_params)
      redirect_to app_url
    else
      render :edit
    end
  end

  def destroy
    task = Task.find params[:id]
    task.destroy
    redirect_to app_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :body, :category_id)
  end
end
