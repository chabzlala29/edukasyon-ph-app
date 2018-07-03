class Course < ApplicationRecord
  has_and_belongs_to_many :teachers, before_add: :check_teachers

  validates :name, :summary, :room, :description, presence: true

  attr_accessor :teachers_ids

  private

  def check_teachers(teacher)
    raise ActiveRecord::Rollback if teachers.include?(teacher)
  end
end
