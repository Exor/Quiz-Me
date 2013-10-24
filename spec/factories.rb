FactoryGirl.define do
	factory :user do
		sequence(:name) { |n| "person_#{n}" }
		sequence(:email){ |n| "person_#{n}@example.com" }
		password "foobarbaz"
		password_confirmation "foobarbaz"
	end
	
	factory :quiz do
		name "My Quiz"
		description "This is my quiz."
		help_text "This is help text."
		access_count 0
	end
	
	factory :question do
		quiz
		category "tf"
		content "Is your name foobar?"
		explanation "Because you are a program!"
	end

	factory :answer do
		question
		content "true"
	end
end