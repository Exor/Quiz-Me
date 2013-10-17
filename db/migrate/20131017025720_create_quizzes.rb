class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
		t.integer :user_id
		t.string :quiz_name
		t.string :description
		t.string :help_text
		t.integer :access_count
		t.timestamps
    end
	add_index :quizzes, [:user_id, :created_at]
  end
end
