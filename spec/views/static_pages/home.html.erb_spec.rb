require 'spec_helper'

describe "home.html" do
	subject { page }
	before { visit '/static_pages/home' }

	it { should have_title("Quiz | Home") }
end
