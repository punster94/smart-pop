class AddTeacherNameToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :teacher_name, :string
  end
end
