class Teacher < ApplicationRecord
  has_and_belongs_to_many :courses

  GENDERS = %w( Male Female Transgender )

  def name
    [title, firstname, lastname].compact.join(" ")
  end

  def gender
    GENDERS[super || 0]
  end
end
