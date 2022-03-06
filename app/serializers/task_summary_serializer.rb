class TaskSummarySerializer < ActiveModel::Serializer
  attributes :id, :title, :is_completed, :user_id
end
