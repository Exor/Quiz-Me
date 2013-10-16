require 'spec_helper'

describe "home.html" do
	subject { page }
	before { visit root_path }

	it { should have_title("Quiz | Home") }
end
