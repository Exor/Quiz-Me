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
				 
	end
	

end