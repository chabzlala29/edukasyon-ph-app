class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :teacher

  validates :rating, :comment, presence: true
  validates :rating, inclusion: 1..5
  validates :rating, uniqueness: { scope: [:user_id, :teacher] }

  default_scope { order(created_at: :desc) }

  def remaining_rating
    5 - (rating || 0)
  end
end
