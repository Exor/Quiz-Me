# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
QuizGenerator::Application.initialize!

ActionView::Base.field_error_proc = Proc.new do |html_tag, instance_tag|
	class_attr_index = html_tag.index 'class="'

  	if class_attr_index
    	html_tag.insert class_attr_index+7, 'has-error '
 	else
   		html_tag.insert html_tag.index('>'), ' class="has-error"'
 	end	

	if html_tag =~ /^<label/
		errors = Array(instance_tag.error_message).join(',')
		"#{html_tag}<div class='error'><small>#{errors}</small></div>".html_safe
	else
		"#{html_tag}".html_safe
	end
  #{}"<span class='field_error'>#{html_tag}</span>".html_safe
end