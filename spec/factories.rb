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
		number 1
		category "tf"
		content "Your name is Jon."
		tf_answer "t"
		explaination "Because you are the programmer!"
	end
end