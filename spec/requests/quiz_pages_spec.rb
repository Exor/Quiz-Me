require 'spec_helper'

describe "QuizPages" do
	subject { page }
	let(:user) { FactoryGirl.create(:user) }
	before { sign_in user }	

	describe "browse page" do
		let!(:quiz) { FactoryGirl.create(:quiz, user: user, name: "Quiz One", description: "descroitpion one", access_count: 5) }
	
		before { visit browse_path }
	
		it { should have_link("Create a New Quiz", href: new_quiz_path) }
	
		describe "quizzes" do
			it { should have_content(quiz.name) }
			it { should have_content(quiz.description) }
			it { should have_content(quiz.access_count) }
		end
		
		describe "quiz delete button" do
			it "should delete a quiz" do
				expect { click_link "Delete" }.to change(Quiz, :count).by(-1)
			end
		end
		
		describe "quiz edit button" do
			it { should have_link("Edit", href: edit_quiz_path(quiz)) }
		end
		
		describe "quiz take button" do
			it { should have_link("Take", href: quiz_path(quiz)) }
		end
	end
	
	describe "quiz create page" do
		before { visit new_quiz_path }
		
		it { should have_title("Create a New Quiz") }
		it { should have_content("Title") }
		
		describe "with invalid information" do
			it "should not create a quiz" do
				expect { click_button "submit-top" }.not_to change(Quiz, :count)
			end
			
			describe "error message" do
				before { click_button "submit-top" }
				it { should have_content('error') }
			end
		end
		
		describe "with no question" do
			before { fill_in "Title", with: 'Quiz Title' }
			it "should not create a quiz" do
				expect {click_button "submit-top"}.not_to change(Quiz, :count)
			end
		end
	end
	
	describe "quiz edit page" do
		let!(:quiz) { FactoryGirl.create(:quiz, user: user) }
		let!(:question) { FactoryGirl.create(:question, quiz: quiz) }
		before { visit edit_quiz_path(quiz) }
	
		it { should have_title("Edit") }
		
		describe "with valid information" do
			before { click_button "submit-top" }
			it { should have_content('Quiz updated') }
		end
		
		describe "changing checkboxes" do
			before do 
				check "allow_restart"
				check "allow_delete"
				check "allow_review"
				check "show_answer"
				check "show_explaination"
				click_button "submit-top"
			end
			it { should have_content('Quiz updated') }
			specify { expect(quiz.reload.allow_restart).to eq true }
			specify { expect(quiz.reload.allow_delete).to eq true }
			specify { expect(quiz.reload.allow_review).to eq true }
			specify { expect(quiz.reload.show_answer).to eq true }
			specify { expect(quiz.reload.show_explaination).to eq true }
		end
				
		describe "with invalid information" do
			before do
				fill_in "Title", with: ' '
				click_button "submit-top"
			end
			it { should have_content('error') }
		end
		
		describe "question creation" do
			describe
		end
	end
	

end
