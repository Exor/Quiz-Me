class AddQuizHasToQuizTable < ActiveRecord::Migration
  def change
  	add_column :quizzes, :unique_url, :string, unique: true
  end
end
