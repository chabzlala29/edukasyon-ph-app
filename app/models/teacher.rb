class Teacher < ApplicationRecord
  has_and_belongs_to_many :courses, join_table: :courses_teachers
  has_many :ratings

  GENDERS = %w( Male Female Transgender )

  ransacker :name, formatter: proc {|v| v.downcase } do |parent|
    Arel::Nodes::NamedFunction.new('LOWER',
      [Arel::Nodes::NamedFunction.new('concat_ws', [Arel::Nodes.build_quoted(' '), parent.table[:firstname], parent.table[:lastname]])]
    )
  end

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
