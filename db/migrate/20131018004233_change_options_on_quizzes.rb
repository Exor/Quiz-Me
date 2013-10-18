class ChangeOptionsOnQuizzes < ActiveRecord::Migration
  def change
	rename_column :quizzes, :disable_restart, :allow_restart
	rename_column :quizzes, :disable_delete, :allow_delete
	change_column :quizzes, :allow_restart, :boolean, default: false
	change_column :quizzes, :allow_delete, :boolean, default: false
  end
end
