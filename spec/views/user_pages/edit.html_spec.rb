require 'spec_helper'

describe "edit.html" do

	subject { page }
	let(:user) { User.new(name: "ExampleUser", 
			email: "user@example.com",
			password: "foobarbaz", 
			password_confirmation: "foobarbaz") }
	before do
		user.save
		visit edit_user_path(user)
	end

	it { should have_content('Update') }
	it { should have_title('Edit') }
		
	describe "with invalid information" do
		before { click_button "Save changes" }

		it { should have_selector('div.alert.alert-error', text: 'error') }
	end
		
	describe "with valid information" do

	end
	
end