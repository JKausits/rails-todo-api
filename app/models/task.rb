class Task < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 255, minimum: 3}
  validates :description, presence: true, length: { minimum: 10 }

  scope :completed, -> { where.not(completed_at: nil) }
  scope :not_completed, -> { where(completed_at: nil)}

  def complete!
    self.update(completed_at: DateTime.now)
  end

  def is_completed
    !self.completed_at.nil?
  end
end
