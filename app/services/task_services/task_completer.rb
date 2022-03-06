module TaskServices
  class TaskCompleter < ApplicationService
    attr_reader :id
    def initialize(id:)
      @id = id
    end

    def call
      complete_task
    end

    private
    def complete_task
      task = Task.find(id)
      task.update(completed_at: DateTime.now)
      return task
    end
  end
end
