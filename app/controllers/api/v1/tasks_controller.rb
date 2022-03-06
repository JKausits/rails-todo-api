class Api::V1::TasksController < ApplicationController
  before_action :authenticate
  before_action :find_task, only: [:show, :complete, :update]
  before_action :validate_owner, only: [:show, :complete, :update]

  def create
    @task = Task.create(
      title: params[:title],
      description: params[:description],
      user_id: @user.id
    )

    render json: @task, serializer: TaskDetailSerializer, status: :created
  end

  def index
    @tasks = @user.tasks
    @tasks = params[:completed] == 'true' ? @tasks.completed : @tasks.not_completed if params[:completed].present?

    render json: @tasks, each_serializer: TaskSummarySerializer
  end

  def show
    render json: @task, serializer: TaskDetailSerializer
  end

  def complete
    @task.complete!
    render json: @task, serializer: TaskDetailSerializer
  end

  def update
    @task.update(
      title: params[:title],
      description: params[:description])
    render json: @task, serializer: TaskDetailSerializer
  end

  private
  def validate_owner
    render json: { message: 'Invalid Permissions'}, status: :unauthorized if @task.user_id != @user.id
  end

  def find_task
    @task ||= Task.find(params['id'])
  end
end
