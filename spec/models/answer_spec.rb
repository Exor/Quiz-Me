require 'spec_helper'

describe Answer do
	let(:user) { FactoryGirl.create(:user) }
	let(:quiz) { FactoryGirl.create(:quiz, user: user) }
	let(:question) {FactoryGirl.create(:question, quiz: quiz)}

	before do
		@answer = Answer.new(question_id: question.id,
				content: "The answer fool",
				)
	end
	subject { @answer }
	
	it { should respond_to(:content) }
	it { should respond_to(:question_id) }
	it { should respond_to(:explanation) }
	its(:question) { should eq question }
	it { should be_valid }

	describe "when question_id is blank" do
		before { @answer.question = nil}
		it { should_not be_valid }
	end


	describe "when content is blank" do
		before { @answer.content = nil }
		it { should_not be_valid }
	end
end
