class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255, minimum: 3}
  validates :description, presence: true, length: { minimum: 10 }

  scope :completed, -> (completed) { filter_completed(completed) }

  def is_completed
    !self.completed_at.nil?
  end

  private
  def self.filter_completed(completed)
    if completed.nil?
      return
    else
      completed == 'true' ? where.not(completed_at: nil) : where(completed_at: nil)
    end
  end
end
