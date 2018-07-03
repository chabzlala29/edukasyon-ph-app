class CoursesTeacher < ApplicationRecord
  belongs_to :course
  belongs_to :teacher

  validates :course, uniqueness: { scope: :teacher }
end
