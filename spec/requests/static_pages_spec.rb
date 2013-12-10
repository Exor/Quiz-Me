require 'spec_helper'

describe "StaticPages" do
  
  let(:baseTitle) {"Quiz Me"}
  
  subject { page }
  
	describe "Home Page" do
		before { visit root_path }
		it { should have_title("#{baseTitle}") }
	end
	
	describe "About Page" do
		before { visit about_path }
		it { should have_content('About') }
		it { should have_title("#{baseTitle} | About") }
	end

end
