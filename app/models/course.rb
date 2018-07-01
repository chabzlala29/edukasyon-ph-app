class Course < ApplicationRecord
  has_and_belongs_to_many :teachers

  validates :name, presence: true
end
