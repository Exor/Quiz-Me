require 'spec_helper'

describe "about.html" do
	subject { page }
	before { visit '/static_pages/about' }
	
	it { should have_title("Quiz | About") }
end
