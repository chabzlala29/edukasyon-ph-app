class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :summary
      t.text :description
      t.integer :parent_id
      t.string :room

      t.timestamps
    end
    add_index :courses, :parent_id
  end
end
