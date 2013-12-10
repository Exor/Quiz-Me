require 'spec_helper'

describe Answer do
	let(:user) { FactoryGirl.create(:user) }
	let(:quiz) { FactoryGirl.create(:quiz, user: user) }
	let(:question) {FactoryGirl.create(:question, quiz: quiz)}
	let(:answer) {FactoryGirl.create(:answer, question: question)}

	subject { answer }
	
	it { should respond_to(:content) }
	it { should respond_to(:question_id) }
	its(:question) { should eq question }
	it { should be_valid }

	describe "when content is blank" do
		before { answer.content = nil }
		it { should_not be_valid }
	end
end
