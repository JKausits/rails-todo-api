class Api::V1::TasksController < ApplicationController
  before_action :authenticate

  def create
    @task = TaskServices::TaskCreator.call(
      title: params[:title],
      description: params[:description]
    )

    render json: @task, serializer: TaskDetailSerializer, status: :created
  end

  def index
    @tasks = TaskServices::TasksReader.call(completed: params['completed'])
    render json: @tasks, each_serializer: TaskSummarySerializer
  end

  def show
    @task = TaskServices::TaskReader.call(id: params[:id])
    render json: @task, serializer: TaskDetailSerializer
  end

  def complete
    @task = TaskServices::TaskCompleter.call(id: params[:id])
    render json: @task, serializer: TaskDetailSerializer
  end

  def update
    @task = TaskServices::TaskUpdater.call(
      id: params['id'],
      title: params['title'],
      description: params['description'])
    render json: @task, serializer: TaskDetailSerializer
  end
end
