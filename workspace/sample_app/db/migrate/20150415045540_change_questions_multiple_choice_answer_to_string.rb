class ChangeQuestionsMultipleChoiceAnswerToString < ActiveRecord::Migration
  def change
    change_column :questions, :multiple_choice_answer, :string
  end
end
