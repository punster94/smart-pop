class RemoveQuizIdFromResponses < ActiveRecord::Migration
  def change
    remove_column :responses, :quiz_id
  end
end
