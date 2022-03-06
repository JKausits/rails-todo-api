module TaskServices
  class TaskCreator < ApplicationService
    attr_reader :title, :description
    def initialize(title:, description:)
      @title = title
      @description = description
    end

    def call
      create_task
    end

    private

    def create_task
      Task.create(
        title: title,
        description: description
      )
    end
  end
end