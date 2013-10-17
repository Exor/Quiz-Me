class ChangeQuizNameOnQuizzes < ActiveRecord::Migration
  def change
	rename_column :quizzes, :quiz_name, :name
  end
end
