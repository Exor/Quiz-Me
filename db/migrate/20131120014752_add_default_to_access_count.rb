class AddDefaultToAccessCount < ActiveRecord::Migration
  def change
  	change_column :quizzes, :access_count, :integer, default: 0
  end
end
