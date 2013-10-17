require 'spec_helper'

describe "signin.html" do

	subject { page }

	describe "signin page" do
		before { visit signin_path }

		it { should have_content('Sign in') }
		it { should have_title('Sign in') }
		
		describe "with invalid information" do
			before { click_button "Sign in" }

			it { should have_title('Sign in') }
			it { should have_selector('div.alert.alert-error', text: 'Invalid') }
		end
		
		describe "with valid information" do
			let(:user) { FactoryGirl.create(:user) }
			before do
				user.save
				fill_in "Username",    with: user.name
				fill_in "Password", with: user.password
				click_button "Sign in"
			end

			it { should have_link('Logout',    href: signout_path) }
			it { should have_link('Change Password',    href: edit_user_path(user)) }
			it { should_not have_link('Log in', href: signin_path) }
			
			describe "followed by signout" do
				before { click_link "Logout" }
				it { should_not have_link('Logout') }
			 end
		end
	
	end
end