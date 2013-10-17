require 'spec_helper'

describe "UserPages" do
  
  subject { page }
  
  describe "edit page" do
	let(:user) { FactoryGirl.create(:user) }
	before do
      sign_in user
      visit edit_user_path(user)
    end
	
	describe "settings page" do
		it { should have_content("Update your profile") }
		it { should have_title("Edit user") }
	end
	
	describe "with invalid information" do
		before { click_button "Save changes" }
		
		it { should have_content('error') }
	end
	
	describe "with valid information" do
      let(:new_name)  { "newusername" }
      let(:new_email) { "new@example.com" }
      before do
        fill_in "Username",             with: new_name
        fill_in "Email",            with: new_email
        fill_in "New Password",         with: user.password
        fill_in "Confirm New Password", with: user.password
        click_button "Save changes"
      end

      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Logout', href: signout_path) }
      specify { expect(user.reload.name).to  eq new_name }
      specify { expect(user.reload.email).to eq new_email }
    end
  end
  
	describe "browse page" do
		let(:user) { FactoryGirl.create(:user) }
		let!(:quiz1) { FactoryGirl.create(:quiz, user: user, name: "Quiz One", description: "descroitpion one", access_count: 5) }
		let!(:quiz2) { FactoryGirl.create(:quiz, user: user, name: "QUiz Two", description: "descroitpion two", access_count: 254) }
	
		before { visit browse_path }
	
		describe "quizzes" do
			it { should have_content(quiz1.name) }
			it { should have_content(quiz2.name) }
			it { should have_content(quiz1.description) }
			it { should have_content(quiz2.description) }
			it { should have_content(quiz1.access_count) }
			it { should have_content(quiz2.access_count) }
			
		end
	
	end
	
end
