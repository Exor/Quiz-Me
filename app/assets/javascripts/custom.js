function initialize(){
var switchTo5x=true;
stLight.options({publisher: "88366333-b42c-4103-adcb-648d74c35fd4", doNotHash: true, doNotCopy: true, hashAddressBar: false});
updateOnscreenNumbers();
hideAnswers();
}

$(document).ready(initialize);
$(document).on('page:load', initialize);

function remove_fields(link) {
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest(".fields").slideUp(400, updateOnscreenNumbers);
}

function remove_field(link) {
    $(link).prev("input[type=hidden]").val("1");
}

function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regex = new RegExp("new_" + association, "g");
    contents = content.replace(regex, new_id);
    $(link).parent().before(content.replace(regex, new_id));
    $(link).parent().prev().hide().slideDown();
    if (association == "questions") {
    	$(link).parent().prev().children().children(".add_answer_button").children().click();
    }
    updateOnscreenNumbers();
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
		$(select).nextAll(".answer").children("label").first().text("Correct Answer");

		$(select).nextAll(".answer").children(".fillanswer").show();
		$(select).nextAll(".answer").children(".tfanswer").hide();
		$(select).nextAll(".answer").children(".tfanswer").children("input").prop('checked', false);
	}

	hideDeletedAnswers(select);
}

function hideAnswers() {
	$('a.remove_question').first().hide();
	var selectors = $('.questiontype');
	for (i=0;i<selectors.length;i++)
		{changeType(selectors[i]);}
}

function hideDeletedAnswers(select) {
	$(select).nextAll(".answer").children("input[type=hidden][value=1]").parent().hide();
}

function removeAllButFirstAnswer(select) {
	remove_fields($(select).nextAll(".answer:not(:first)").children("a"));
}

function dealWithAddAnswerButton() {
	var buttons = $(".add_answer_button");
	$(buttons).each(function(i){
		$(this).show();
		var answerLength = $(this).prevAll(".answer").filter(":visible").length;
		if (answerLength >= 6) {
			$(this).hide();
		}
	});
}

function dealWithAddQuestionButton() {
	$(".add_question_button").show();
	var numberOfVisibleQuestions = $(".question_box").children(".question").filter(":visible").length;

	if (numberOfVisibleQuestions >= 10) {
		$(".add_question_button").hide();
	}
}

function setQuestionNumber(){
	var elements = $("h2:contains('Question')").filter(":visible");
		$(elements).each(function(i){
			var num = i + 1;
			var str = 'Question ' + num;
			$(this).text(str);
		});
}

function setAnswerNumber(){
	var questions = $("fieldset.question.fields").filter(":visible");
	$(questions).each(function(i){
		var answers = $(this).children("fieldset.answer.fields").filter(":visible");
		$(answers).each(function(i){
			if (i===0)
				{ var str = "Correct Answer"; }
			else
				{ var str = "Wrong Answer " + i; }
			$(this).children("label:contains('Answer')").text(str);

		});


	});
}

function updateOnscreenNumbers(){
	setQuestionNumber();
	setAnswerNumber();
	dealWithAddQuestionButton();
	dealWithAddAnswerButton();
}