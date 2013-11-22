function remove_fields(link) {
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regex = new RegExp("new_" + association, "g");
    $(link).parent().before(content.replace(regex, new_id));
    hideAnswers();
}


function changeType(select)
{
	if (select.selectedIndex==0)
	{//Choose a type
		$(select).nextAll(".answer").hide();
		$(select).nextAll(".add_answer_button").hide();

		removeAllButFirstAnswer(select);
	}
	else if (select.selectedIndex==1)
	{//True/False
		$(select).nextAll(".answer").show();
		$(select).nextAll(".add_answer_button").hide();
		$(select).nextAll(".answer").children(".remove_answer_button").hide();

		$(select).nextAll(".answer").children(".tfanswer").show();
		$(select).nextAll(".answer").children(".fillanswer").hide();

		removeAllButFirstAnswer(select);
	}
	else if (select.selectedIndex==2)
	{//Fill in the blank
		$(select).nextAll(".answer").show();
		$(select).nextAll(".add_answer_button").hide();
		$(select).nextAll(".answer").children(".remove_answer_button").hide();

		$(select).nextAll(".answer").children(".fillanswer").show();
		$(select).nextAll(".answer").children(".tfanswer").hide();
		$(select).nextAll(".answer").children(".tfanswer").children("input").prop('checked', false);

		removeAllButFirstAnswer(select);
	}
	else if (select.selectedIndex==3 || select.selectedIndex==4)
	{//Multiple Choice
		$(select).nextAll(".answer").show();
		$(select).nextAll(".add_answer_button").show();
		$(select).nextAll(".answer").children(".remove_answer_button").show();

		$(select).nextAll(".answer").children(".fillanswer").show();
		$(select).nextAll(".answer").children(".tfanswer").hide();
		$(select).nextAll(".answer").children(".tfanswer").children("input").prop('checked', false);
	}

	hideDeletedAnswers(select);
};

function hideAnswers() {
	var selectors = $('.questiontype')
	for (i=0;i<selectors.length;i++)
		{changeType(selectors[i]);}
}

function hideDeletedAnswers(select) {
	$(select).nextAll(".answer").children("input[type=hidden][value=1]").parent().hide();
}

function removeAllButFirstAnswer(select) {
	remove_fields($(select).nextAll(".answer:not(:first)").children("a"));
}