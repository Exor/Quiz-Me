class AddOptionsToQuizzes < ActiveRecord::Migration
  def change
	add_column :quizzes, :random, :boolean, default: false
	add_column :quizzes, :disable_restart, :boolean, default: false
	add_column :quizzes, :disable_delete, :boolean, default: true
	add_column :quizzes, :allow_review, :boolean, default: true
	add_column :quizzes, :show_answer, :boolean, default: true
	add_column :quizzes, :show_explaination, :boolean, default: true
  end
end
