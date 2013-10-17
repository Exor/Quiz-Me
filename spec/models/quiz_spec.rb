require 'spec_helper'

describe Quiz do
	let(:user) { FactoryGirl.create(:user) }
	before do
		@quiz = user.quizzes.build(
							quiz_name: "My Quiz", 
							description: "This is my quiz.",
							help_text: "This is help text.",
							access_count: 0 )
	end
	
	subject { @quiz }
	
	it { should respond_to(:user_id) }
	it { should respond_to(:quiz_name) }
	it { should respond_to(:description) }
	it { should respond_to(:help_text) }
	it { should respond_to(:access_count) }
	it { should respond_to(:user) }
	its(:user) { should eq user }
	
	it { should be_valid }
	
	describe "when user_id is not present" do
		before { @quiz.user_id = nil }
		it { should_not be_valid }
	end
end
