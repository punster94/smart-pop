class AddUniversityIdToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :university_id, :integer
    remove_column :courses, :university_id
  end
end
