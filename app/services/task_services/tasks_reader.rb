module TaskServices
  class TasksReader < ApplicationService
    attr_reader :completed, :user_id
    def initialize(completed:, user_id:)
      @completed = completed
      @user_id = user_id
    end

    def call
      get_tasks
    end

    private
    def get_tasks
      Task.completed(completed).user(user_id)
    end
  end
end
