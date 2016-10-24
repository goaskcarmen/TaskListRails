class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :complete]

  def index
    @tasks = Task.all
  end

  def show
    # @mytask = Task.find(params[:id].to_i)
  end

  def create
    # @path = "create_path"
    # @method = :post
    # @params = params
    # @mytask = Task.new({name: params[:task][:name], description: params[:task][:description], status: params[:task][:status], completion_date: params[:task][:completion_date]})
    @mytask = Task.new(task_params)
    if @mytask.save
      redirect_to create_path
    else
      render :new
    end
  end

  def new
    @mytask = Task.new
  end

  def edit
    # @mytask = Task.find(params[:id].to_i)
    # @path = "update_path"
    # @method = :get
  end

  def update
    @mytask.update(task_params)
    # @mytask.update({name: params[:task][:name], description: params[:task][:description], status: params[:task][:status], completion_date: params[:task][:completion_date]})
    if @mytask.update(task_params)
      redirect_to update_path
    else
      render :new
    end
  end

  def destroy
    num = params[:id].to_i
    Task.find(num).destroy
    redirect_to action: "index"
  end

  def complete
    @mytask.status = "complete"
    @mytask.completion_date = Time.now
    @mytask.save

    redirect_to action: "index"

  end

  private
  def task_params
    params.require(:task).permit(:name, :description, :status, :completion_date)
  end

  def find_task
    @mytask = Task.find(params[:id].to_i)
  end
end
