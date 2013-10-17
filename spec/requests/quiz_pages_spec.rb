require 'spec_helper'

describe "QuizPages" do
	subject { page }
	let(:user) { FactoryGirl.create(:user) }
	before { sign_in user }	

	describe "browse page" do
		let(:user) { FactoryGirl.create(:user) }
		let!(:quiz) { FactoryGirl.create(:quiz, user: user, name: "Quiz One", description: "descroitpion one", access_count: 5) }
	
		before { visit browse_path }
	
		it { should have_link("Create a New Quiz", href: new_quiz_path) }
	
		describe "quizzes" do
			it { should have_content(quiz.name) }
			it { should have_content(quiz.description) }
			it { should have_content(quiz.access_count) }
		end
		
		describe "quiz deletion" do
			it "should delete a quiz" do
				expect { click_link "Delete" }.to change(Quiz, :count).by(-1)
			end
		end
		
	end
	
	describe "quiz creation" do
		before { visit new_quiz_path }
		
		it { should have_title("Create a New Quiz") }
		
		describe "with invalid information" do
			it "should not create a quiz" do
				expect { click_button "Create" }.not_to change(Quiz, :count)
			end
			
			describe "error message" do
				before { click_button "Create" }
				it { should have_content('error') }
			end
		end
	end
	

end
