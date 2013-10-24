class RemoveAnswersFromQuestions < ActiveRecord::Migration
  def change
  	remove_column :questions, :fill_answer
  	remove_column :questions, :tf_answer
  	remove_column :questions, :multiple_answer
  	remove_column :questions, :explaination
  	add_column :answers, :explanation, :string
  end
end
