class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to app_url
    else
      render :new
    end
  end

  def show
  end

  def destroy
    task = Task.find params[:id]
    task.destroy
    redirect_to app_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :body)
  end
end
