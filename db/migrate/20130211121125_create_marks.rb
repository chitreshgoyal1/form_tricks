class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.integer :subject_id
      t.integer :student_id
      t.float :m_marks
      t.float :obtain_marks
      t.string :grade
      t.text :remarks

      t.timestamps
    end
  end
end
