function remove_fields(link) {
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regex = new RegExp("new_" + association, "g");
    $(link).parent().before(content.replace(regex, new_id));
    //$('#new-question-fields').modal('show');
}


function changeType(select)
{
	if (select.selectedIndex==0)
	{//Choose a type
		$(select).nextAll(".answer_fields").children(".tfanswer").hide();
		$(select).nextAll(".answer_fields").children(".tfanswer").children("input").prop('checked', false);
		$(select).nextAll(".answer_fields").children(".fillanswer").hide();
		$(select).nextAll(".answer_fields").children(".add_remove_answer_link").hide();
		$(select).nextAll(".add_remove_answer_link").hide();
	}
	if (select.selectedIndex==1)
	{//True/False
		$(select).nextAll(".answer_fields").children(".tfanswer").show();
		$(select).nextAll(".answer_fields").children(".fillanswer").hide();
		$(select).nextAll(".answer_fields").children(".add_remove_answer_link").hide();
		$(select).nextAll(".add_remove_answer_link").hide();
	}
	else if (select.selectedIndex==2)
	{//Fill in the blank
		$(select).nextAll(".answer_fields").children(".fillanswer").show();
		$(select).nextAll(".answer_fields").children(".tfanswer").hide();
		$(select).nextAll(".answer_fields").children(".tfanswer").children("input").prop('checked', false);
		$(select).nextAll(".answer_fields").children(".add_remove_answer_link").hide();
		$(select).nextAll(".add_remove_answer_link").hide();
	}
	else if (select.selectedIndex==3 || select.selectedIndex==4)
	{//Multiple Choice
		$(select).nextAll(".answer_fields").children(".fillanswer").show();
		$(select).nextAll(".answer_fields").children(".tfanswer").hide();
		$(select).nextAll(".answer_fields").children(".tfanswer").children("input").prop('checked', false);
		$(select).nextAll(".answer_fields").children(".add_remove_answer_link").show();
		$(select).nextAll(".add_remove_answer_link").show();
	}
};

function hideAnswers() {
	var selectors = $('.questiontype')
	for (i=0;i<selectors.length;i++)
		{changeType(selectors[i]);}
}