require 'spec_helper'

describe "edit.html" do

	subject { page }
	let(:user) { FactoryGirl.create(:user) }
	before {user.save}
		

	describe "for non-signed-in users" do
		before{	visit edit_user_path(user) }
		it { should have_title('Sign in') }
	end
	
	describe "for signed-in users" do
		before do
			sign_in user
			visit edit_user_path(user)
		end
	
		it { should have_content('Update') }
		it { should have_title('Edit') }
			
		describe "with invalid information" do
			before { click_button "Save changes" }

			it { should have_selector('div.alert.alert-error', text: 'error') }
		end
			
		describe "with valid information" do
			let(:new_name) { "newname" }
			let(:new_email) { "new@example.com" }
			let(:new_password) { "newpassword" }
			before do
				fill_in "Username",         with: new_name
				fill_in "Email",            with: new_email
				fill_in "New Password",     with: new_password
				fill_in "Confirm New Password", with: new_password
				click_button "Save changes"
			end

			  it { should have_selector('div.alert.alert-success') }
			  specify { expect(user.reload.name).to  eq new_name }
			  specify { expect(user.reload.email).to eq new_email }
			  specify { expect(user.reload.password).to eq new_password }
		end
	end
		
end