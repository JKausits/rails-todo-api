module TaskServices
  class TasksReader < ApplicationService
    attr_reader :completed
    def initialize(completed:)
      @completed = completed
    end

    def call
      get_tasks
    end

    private
    def get_tasks
      Task.completed(completed)
    end
  end
end
