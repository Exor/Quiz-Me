class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :quiz_id
	  t.integer :number
      t.string :type
      t.string :content
	  t.string :fill_answer
	  t.string :tf_answer
	  t.string :multiple_answer
      t.string :explaination

      t.timestamps
    end
	add_index :questions, [:quiz_id, :number]
  end
end
