class TasksController < ApplicationController

  def index
    @all_tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new # @task is not needed for form, but it is needed for form_for (in partial html)
  end

  def create
    # Task.create title: params[:task_title], details: params[:task_details]
    @task = Task.new(task_params) # should replace with .new(restaurant_params) to use the sanitised params, instead of the dirty one
    @task.save
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @restaurant = Task.find(params[:id])
    @restaurant.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details) # this is called strong params, for security
  end

end
