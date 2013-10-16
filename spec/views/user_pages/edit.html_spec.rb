require 'spec_helper'

describe "edit.html" do
	subject { page }
	
	before { visit users_edit_path }
	
	let(:submit) { "Save Settings" }

end