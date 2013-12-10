require 'spec_helper'

describe Question do
	let(:user) { FactoryGirl.create(:user) }
	let(:quiz) { FactoryGirl.create(:quiz, user: user) }
	let(:question) { FactoryGirl.create(:question, quiz: quiz)}

	subject { question }
	
	it { should respond_to(:content) }
	it { should respond_to(:quiz_id) }
	it { should respond_to(:category) }
	it { should respond_to(:explanation) }
	its(:quiz) { should eq quiz }
	it { should be_valid }

	describe "when category is blank" do
		before { question.category = nil }
		it { should_not be_valid }
	end
	
	describe "when category is valid" do
		it "should be valid" do
			categories = %w[TF Multi fill]
			categories.each do |valid_category|
				question.category = valid_category
				expect(question).to be_valid
			end
		end	
	end
	
	describe "when category is invalid" do
		it "should be invalid" do
			categories = %w[truefalse multiplechoice fillintheblank aoeufill aoeumulti tstuff]
			categories.each do |invalid_category|
				question.category = invalid_category
				expect(question).not_to be_valid
			end
		end	
	end
	
	describe "when content is blank" do
		before { question.content = nil }
		it { should_not be_valid }
	end
end
