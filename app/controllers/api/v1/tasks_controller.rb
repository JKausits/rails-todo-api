class Api::V1::TasksController < ApplicationController
  before_action :authenticate
  before_action :validate_owner, only: [:show, :complete, :update]

  def create
    @task = TaskServices::TaskCreator.call(
      title: params[:title],
      description: params[:description],
      user_id: @user.id
    )

    render json: @task, serializer: TaskDetailSerializer, status: :created
  end

  def index
    @tasks = TaskServices::TasksReader.call(completed: params['completed'], user_id: @user.id)
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

  private
  def validate_owner
    task_user_id = Task.get_user_id(params['id'])
    render json: { message: 'Invalid Permissions'}, status: :unauthorized if task_user_id != @user.id
  end
end
