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
		unique_url "123ABC"
		access_count 0
		questions { Array.new(3) { FactoryGirl.build(:question)}}
	end
	
	factory :question do
		category "tf"
		content "Is your name foobar?"
		explanation "Because you are a program!"
		answers { Array.new(3) { FactoryGirl.build(:answer)}}
	end

	factory :answer do
		content "true"
	end
end