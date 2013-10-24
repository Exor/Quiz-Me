class RemoveQuestionNumberFromQuestions < ActiveRecord::Migration
  def change
  	remove_column :questions, :number
  end
end
