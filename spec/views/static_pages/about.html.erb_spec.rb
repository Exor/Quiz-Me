require 'spec_helper'

describe "about.html" do
	subject { page }
	before { visit about_path }
	
	it { should have_title("Quiz | About") }
end
