namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		User.create!(name: "example",
                 email: "user@example.com",
                 password: "password",
                 password_confirmation: "password")
				 
		users = User.all()
		10.times do
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
				quiz.questions.create!(category: "fill",
									   content: Faker::Lorem.sentence(5),
									   explanation: Faker::Lorem.sentence(5))
				quiz.questions.create!(category: "tf",
									   content: Faker::Lorem.sentence(5),
									   explanation: Faker::Lorem.sentence(5))
				quiz.questions.create!(category: "multi",
									   content: Faker::Lorem.sentence(5),
									   explanation: Faker::Lorem.sentence(5))								   
			end
		end	

		users.each do |user|
			quizzes = user.quizzes.all()
			quizzes.each do |quiz| 
				questions = quiz.questions.all()
				questions.each do |question|
					if question.category == "fill"
						question.answers.create!(content: Faker::Lorem.sentence(1))
					end
					if question.category == "tf"
						question.answers.create!(content: 't')
					end
					if question.category == "multi"
						4.times do 
							question.answers.create!(content: Faker::Lorem.sentence(1))
						end
					end
				end
			end
		end
	end
end