class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @mytask = Task.find(params[:id].to_i)
  end

  def create
    # @path = "create_path"
    # @method = :post
    @params = params

    @mytask = Task.new({name: params[:task][:name], description: params[:task][:description], status: params[:task][:status], completion_date: params[:task][:completion_date]})

    @mytask.save
  end

  def new
    @mytask = Task.new
  end

  def edit
    @mytask = Task.find(params[:id].to_i)
    # @path = "update_path"
    # @method = :get
  end

  def update
    @params = params

    self.edit

    @mytask.update({name: params[:task][:name], description: params[:task][:description], status: params[:task][:status], completion_date: params[:task][:completion_date]})
  end

  def destroy
    num = params[:id].to_i
    Task.find(num).destroy
    redirect_to action: "index"
  end

  def complete
    self.edit

    @mytask.status = "complete"
    @mytask.completion_date = Time.now
    @mytask.save

    redirect_to action: "index"

  end

end
