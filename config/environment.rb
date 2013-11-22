# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
QuizGenerator::Application.initialize!

ActionView::Base.field_error_proc = Proc.new do |html_tag, instance_tag|
	if html_tag =~ /^<label/
		errors = Array(instance_tag.error_message).join(',')
		"#{html_tag}<div class='field_with_errors'>#{errors}</div>".html_safe
	else
		"#{html_tag}".html_safe
	end
  #{}"<span class='field_error'>#{html_tag}</span>".html_safe
end