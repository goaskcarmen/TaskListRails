class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @tasks = Task.all
    @mytask = nil

    @tasks.each do |task|
      num = params[:id].to_i
      if task[:id] == num
        @mytask = task
      end
    end

    if @mytask == nil
      @mytask = {id: params[:id].to_i, name: "Task not found", description: "No such task."}
    end
  end

  def create
    @params = params

    newTask = Task.new({name: params[:name], description: params[:description], status: params[:status], completion_date: params[:completion_date]})

    newTask.save
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
    num = params[:id].to_i
    Task.find(num).destroy
  end

end
