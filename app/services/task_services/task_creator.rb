module TaskServices
  class TaskCreator < ApplicationService
    attr_reader :title, :description, :user_id
    def initialize(title:, description:, user_id:)
      @title = title
      @description = description
      @user_id = user_id
    end

    def call
      create_task
    end

    private

    def create_task
      Task.create(
        title: title,
        description: description,
        user_id: user_id
      )
    end
  end
end