class MoveExplanationFromAnswersToQuestions < ActiveRecord::Migration
  def change
  	remove_column :answers, :explanation
  	add_column :questions, :explanation, :string
  end
end
