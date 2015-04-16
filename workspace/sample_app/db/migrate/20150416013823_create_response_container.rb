class CreateResponseContainer < ActiveRecord::Migration
  def change
    create_table :response_containers do |t|
      t.integer :quiz_id
      t.integer :student_id
      t.timestamps
    end
    
    remove_column :responses, :student_id
    add_column :responses, :response_container_id, :integer
  end
end
