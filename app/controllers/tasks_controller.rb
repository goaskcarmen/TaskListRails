class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @mytask = Task.find(params[:id].to_i)
  end

  def create
    @params = params

    @mytask = Task.new({name: params[:task][:name], description: params[:task][:description], status: params[:task][:status], completion_date: params[:task][:completion_date]})

    @mytask.save
  end

  def new
    @mytask = Task.new
  end

  def edit
    @mytask = Task.find(params[:id].to_i)
  end

  def update
    @params = params

    self.edit

    @mytask.name = params[:task][:name]
    @mytask.description = params[:task][:description]
    @mytask.status = params[:task][:status]
    @mytask.completion_date = params[:task][:completion_date]
  end

  def destroy
    num = params[:id].to_i
    Task.find(num).destroy
  end

end
