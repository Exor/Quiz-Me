FactoryGirl.define do
	factory :user do
		sequence(:name) { |n| "person_#{n}" }
		sequence(:email){ |n| "person_#{n}@example.com" }
		password "foobarbaz"
		password_confirmation "foobarbaz"
	end
	
	factory :quiz do
		quiz_name "My Quiz"
		description "This is my quiz."
		help_text "This is help text."
		access_count 0
	end
end