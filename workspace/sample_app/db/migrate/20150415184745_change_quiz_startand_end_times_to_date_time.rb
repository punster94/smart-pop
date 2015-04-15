class ChangeQuizStartandEndTimesToDateTime < ActiveRecord::Migration
  def change
    change_column :quizzes, :start_time, :datetime
    change_column :quizzes, :end_time, :datetime
  end
end
