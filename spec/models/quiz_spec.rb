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
	it { should respond_to(:questions) }
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
	
	describe "question associations" do
		before { @quiz.save }
		let!(:question_1) { FactoryGirl.create(:question, quiz: @quiz) }
		let!(:question_2) { FactoryGirl.create(:question, quiz: @quiz) }
		
		
		it "should have the right questions in the right order" do
		  expect(@quiz.questions.to_a).to eq [question_1, question_2]
		end
		
		it "should destroy associated questions" do
			questions = @quiz.questions.to_a
			@quiz.destroy
			expect(questions).not_to be_empty
			questions.each do |question|
				expect(Question.where(id: question.id)).to be_empty
			end
		end
	end
end
