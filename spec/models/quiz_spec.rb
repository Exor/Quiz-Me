require 'spec_helper'

describe Quiz do
	let(:user) { FactoryGirl.create(:user) }
	before do
		@quiz = user.quizzes.build(
							name: "My Quiz", 
							description: "This is my quiz.",
							help_text: "This is help text.",
							access_count: 0 )
	end
	
	subject { @quiz }
	
	it { should respond_to(:user_id) }
	it { should respond_to(:name) }
	it { should respond_to(:description) }
	it { should respond_to(:help_text) }
	it { should respond_to(:access_count) }
	it { should respond_to(:user) }
	it { should respond_to(:random) }
	it { should respond_to(:allow_restart) }
	it { should respond_to(:allow_delete) }
	it { should respond_to(:allow_review) }
	it { should respond_to(:show_answer) }
	it { should respond_to(:show_explaination) }
	its(:user) { should eq user }
	
	it { should be_valid }
	
	describe "when user_id is not present" do
		before { @quiz.user_id = nil }
		it { should_not be_valid }
	end
	
	describe "when quiz_name is blank" do
		before { @quiz.name = " " }
		it { should_not be_valid }
	end
end
