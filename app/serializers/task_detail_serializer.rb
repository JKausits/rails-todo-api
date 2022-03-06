class TaskDetailSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :completed_at
end
