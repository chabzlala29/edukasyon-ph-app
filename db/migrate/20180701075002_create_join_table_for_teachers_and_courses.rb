class CreateJoinTableForTeachersAndCourses < ActiveRecord::Migration[5.2]
  def change
    create_join_table(:teachers, :courses)
  end
end
