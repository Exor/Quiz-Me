require 'spec_helper'

describe Question do
	let(:user) { FactoryGirl.create(:user) }
	let(:quiz) { FactoryGirl.create(:quiz, user: user) }

	before do
		@question = Question.new(quiz_id: quiz.id,
				number: 1,
				category: "tf",
				content: "Your name is Jon.",
				tf_answer: true,
				explaination: "Because you are the programmer!")
	end
	subject { @question }
	
	it { should respond_to(:content) }
	it { should respond_to(:quiz_id) }
	it { should respond_to(:category) }
	it { should respond_to(:fill_answer) }
	it { should respond_to(:tf_answer) }
	it { should respond_to(:multiple_answer) }
	it { should respond_to(:explaination) }
	its(:quiz) { should eq quiz }
	it { should be_valid }

	describe "when category is blank" do
		before { @question.category = nil }
		it { should_not be_valid }
	end
	
	describe "when category is valid" do
		before do
			@question.tf_answer = true
			@question.fill_answer = "answer"
			@question.multiple_answer = "1 or 2"
		end
		it "should be valid" do
			categories = %w[TF Multi fill]
			categories.each do |valid_category|
				@question.category = valid_category
				expect(@question).to be_valid
			end
		end	
	end
	
	describe "when category is invalid" do
		it "should be invalid" do
			categories = %w[truefalse multiplechoice fillintheblank aoeufill aoeumulti tstuff]
			categories.each do |invalid_category|
				@question.category = invalid_category
				expect(@question).not_to be_valid
			end
		end	
	end
	
	describe "when content is blank" do
		before { @question.content = nil }
		it { should_not be_valid }
	end
	
	describe "when category is tf and tf_answer is blank" do
		before do
			@question.category = "tf"
			@question.tf_answer = nil
		end
		it { should_not be_valid }
	end
	
	describe "when category is fill and fill_answer is blank" do
		before do
			@question.category = "fill"
			@question.fill_answer = nil
		end
		it { should_not be_valid }
	end
	
	describe "when category is multi and multi_answer is blank" do
		before do
			@question.category = "multi"
			@question.multiple_answer = nil
		end
		it { should_not be_valid }
	end
end
