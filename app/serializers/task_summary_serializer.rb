class TaskSummarySerializer < ActiveModel::Serializer
  attributes :id, :title, :is_completed

  private

end
