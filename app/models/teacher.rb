class Teacher < ApplicationRecord
  has_and_belongs_to_many :courses
  has_many :ratings

  GENDERS = %w( Male Female Transgender )

  def name
    [title, firstname, lastname].compact.join(" ")
  end

  def gender
    GENDERS[super || 0]
  end

  def average_rating
    ratings.average(:rating).round
  rescue
    0
  end

  def average_remaining_rating
    5 - average_rating
  end
end
