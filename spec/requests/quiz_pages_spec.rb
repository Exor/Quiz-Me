require 'spec_helper'

describe "QuizPages" do
	subject { page }
	let(:user) { FactoryGirl.create(:user) }
	before { sign_in user }	
		
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
