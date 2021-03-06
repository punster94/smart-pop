class AddInitialTablesToSchema < ActiveRecord::Migration
  def change
    create_table :universities do |u|
      u.integer :user_id
        
      u.timestamps
    end
    
    create_table :teachers do |t|
      t.integer :user_id
      
      t.timestamps
    end
    
    create_table :students do |s|
      s.integer :user_id
      
      s.timestamps
    end
  
    create_table :courses do |c|
      c.integer :teacher_id
      c.integer :university_id
      c.string :course_name
      c.string :course_number
      c.string :section_number
      c.string :enrollment_code
      
      c.timestamps
    end
    
    create_table :questions do |q|
      q.integer :quiz_id
      q.text :question_text
      q.string :type
      q.binary :picture, :limit => 10.megabyte
      q.integer :multiple_choice_answer
      q.text :input_text_answer
      
      q.timestamps
    end
    
    create_table :responses do |r|
      r.integer :question_id
      r.integer :student_id
      r.integer :multiple_choice_answer
      r.text :text_answer
      
      r.timestamps
    end
    
    create_table :quizzes do |q|
      q.integer :course_id
      q.integer :teacher_id
      q.string :title
      q.string :start_time
      q.string :end_time
   
      q.timestamps
    end
    
    create_table :multiple_choice_options do |o|
      o.integer :question_id
      o.text :description
      
      o.timestamps
    end
    
    add_column :users, :sub, :boolean, default: false
  end
end
