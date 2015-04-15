class AddValidatedToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :validated, :boolean, default: false
  end
end
