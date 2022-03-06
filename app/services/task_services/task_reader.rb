module TaskServices
  class TaskReader < ApplicationService
    attr_reader :id
    def initialize(id:)
      @id = id
    end

    def call
      find_task
    end

    private
    def find_task
      Task.find(id)
    end
  end
end
