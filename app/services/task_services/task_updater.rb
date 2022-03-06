module TaskServices
  class TaskUpdater < ApplicationService
    attr_reader :id, :title, :description
    def initialize(id:, title:, description:)
      @id = id
      @title = title
      @description = description
    end

    def call
      update_task
    end

    private
    def update_task
      task = Task.find(id)
      task.update(title: title, description: description)
      return task
    end
  end
end
