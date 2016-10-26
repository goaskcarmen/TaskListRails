class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :complete, :destroy]
  before_action :validate_user_tasks, only: [:show, :edit, :update, :complete, :destroy]

  def index
    @tasks = current_user.tasks
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
    current_user.tasks << @mytask

    if @mytask.save
      redirect_to index_path
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
    # @mytask.update({name: params[:task][:name], description: params[:task][:description], status: params[:task][:status], completion_date: params[:task][:completion_date]})
    if @mytask.update(task_params)
      redirect_to task_path
    else
      render :new
    end
  end

  def destroy
    @mytask.destroy
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

  def validate_user_tasks
    if !current_user.tasks.include? @mytask
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
