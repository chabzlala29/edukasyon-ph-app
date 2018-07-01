class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :title
      t.string :firstname
      t.string :lastname
      t.integer :gender
      t.string :degree
      t.date :start_date
      t.string :school_graduated
      t.text :major_accomplishments

      t.timestamps
    end
  end
end
