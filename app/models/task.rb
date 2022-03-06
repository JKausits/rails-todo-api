class Task < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 255, minimum: 3}
  validates :description, presence: true, length: { minimum: 10 }

  scope :completed, -> (completed) { filter_completed(completed) }
  scope :user, -> (user_id) { where(user_id: user_id) }
  scope :get_user_id, -> (id) { where(id: id).pluck(:user_id)[0]}

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
