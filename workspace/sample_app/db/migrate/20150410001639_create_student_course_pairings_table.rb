class CreateStudentCoursePairingsTable < ActiveRecord::Migration
  def change
    create_table :student_course_pairings do |t|
      t.integer :student_id
      t.integer :course_id
      t.boolean :validated, default: false
      
      t.timestamps
    end
  end
end
