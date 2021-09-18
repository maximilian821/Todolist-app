class TasksController < ApplicationController
  def index
    if params[:completed] == 'true'
      @status = :completed
      @tasks = current_user.tasks.not_archived.where(status: :completed).order(created_at: :asc)
    elsif params[:uncompleted] == 'true'
      @status = :uncompleted
      @tasks = current_user.tasks.not_archived.where(status: :uncompleted).order(created_at: :asc)
    elsif params[:archived] == 'true'
      @status = :archived
      @tasks = current_user.tasks.only_archived.order(created_at: :asc)
    else
      @tasks = current_user.tasks.not_archived.order(created_at: :desc)
    end

    respond_to do |format|
      format.js
    end
  end

  def show; end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @categories = current_user.categories
    if @task.save
      redirect_to app_url
    else
      render :new
    end
  end

  def update_status
    @task = Task.find(params[:id])
    @task.update(status: params[:status])
    respond_to do |format|
      format.js
    end
  end

  def update_archived_field
    @task = Task.find(params[:id])
    @task.update(archived: params[:archived])
    respond_to do |format|
      format.js
    end
  end

  def edit
    @task = Task.find(params[:id])
    @categories = Category.where(user_id: current_user.id)
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
    @task = Task.find params[:id]
    @task.delete
    respond_to do |format|
      format.js
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :body, :category_id, :user_id)
  end
end
