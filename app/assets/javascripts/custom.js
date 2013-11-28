function initialize(){
stLight.options({publisher: "88366333-b42c-4103-adcb-648d74c35fd4", doNotHash: true, doNotCopy: true, hashAddressBar: false});	
}

$(document).ready(initialize);
$(document).on('page:load', initialize);

function remove_fields(link) {
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest(".fields").hide();
    dealWithRemoveAnswerButton(link);
    dealWithRemoveQuestionButton(link);
}

function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regex = new RegExp("new_" + association, "g");
    $(link).parent().before(content.replace(regex, new_id));
    if (association == "questions") {
    	$(link).parent().prev().children().children(".add_answer_button").children().click();
    }
    hideAnswers();
    dealWithAddAnswerButton(link);
    dealWithAddQuestionButton(link);
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
		$(select).nextAll(".answer").children("label").first().text("Answer");

		$(select).nextAll(".answer").children(".tfanswer").show();
		$(select).nextAll(".answer").children(".fillanswer").hide();

		removeAllButFirstAnswer(select);
	}
	else if (select.selectedIndex==2)
	{//Fill in the blank
		$(select).nextAll(".answer").show();
		$(select).nextAll(".add_answer_button").hide();
		$(select).nextAll(".answer").children(".remove_answer_button").hide();
		$(select).nextAll(".answer").children("label").first().text("Answer");

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
		$(select).nextAll(".answer").first().children(".remove_answer_button").hide();
		
		$(select).nextAll(".answer").children("label").text("Wrong Answer");
		$(select).nextAll(".answer").children("label").first().text("Correct Answer");

		$(select).nextAll(".answer").children(".fillanswer").show();
		$(select).nextAll(".answer").children(".tfanswer").hide();
		$(select).nextAll(".answer").children(".tfanswer").children("input").prop('checked', false);
	}

	hideDeletedAnswers(select);
};

function hideAnswers() {
	$('a.remove_question').first().hide();
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

function dealWithAddAnswerButton(link) {
	$(link).show();
	var answerLength = $(link).parent().prevAll(".answer").length;
	var hiddenAnswerLength = $(link).parent().prevAll(".answer").children("input[type=hidden][value=1]").length;
	if (answerLength - hiddenAnswerLength >= 6) {
		$(link).hide();
	}
}

function dealWithRemoveAnswerButton(link) {
	dealWithAddAnswerButton($(link).parent().nextAll(".add_answer_button").children());
}

function dealWithAddQuestionButton(link) {
	$(link).show();
	var questionLength = $(link).parent().prevAll(".question_box").length;
	var hiddenQuestionLength = $(link).parent().prevAll(".question_box").children("fieldset").children("h2").children("input[type=hidden][value=1]").length;
	if (questionLength - hiddenQuestionLength >= 10) {
		$(link).hide();
	}
}

function dealWithRemoveQuestionButton(link) {
	dealWithAddQuestionButton($(link).parent().parent().parent().nextAll(".add_question_button").children());
}