namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		User.create!(name: "example",
                 email: "user@example.com",
                 password: "password",
                 password_confirmation: "password")
				 
		users = User.all()
		40.times do
			name = Faker::Lorem.sentence(1)
			description = Faker::Lorem.sentence(5)
			help_text = Faker::Lorem.sentence(7)
			users.each { |user| user.quizzes.create!(name: name, 
														description: description, 
														help_text: help_text) }
		end
		users.each do |user|
			quizzes = user.quizzes.all()
			quizzes.each do |quiz| 
				quiz.questions.create!(number: 1,
									   category: "fill",
									   content: Faker::Lorem.sentence(5),
									   fill_answer: Faker::Lorem.sentence(1),
									   explaination: Faker::Lorem.sentence(5))
				quiz.questions.create!(number: 2,
									   category: "tf",
									   content: Faker::Lorem.sentence(5),
									   tf_answer: "f",
									   explaination: Faker::Lorem.sentence(5))
				quiz.questions.create!(number: 3,
									   category: "multi",
									   content: Faker::Lorem.sentence(5),
									   multiple_answer: Faker::Lorem.sentence(1),
									   explaination: Faker::Lorem.sentence(5))									   
			end
		end	
	end
	

end