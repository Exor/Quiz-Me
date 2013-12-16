function initialize(){
var switchTo5x=true;
stLight.options({publisher: "88366333-b42c-4103-adcb-648d74c35fd4", doNotHash: true, doNotCopy: true, hashAddressBar: false});
updateOnscreenNumbers();
}

$(document).ready(initialize);
$(document).on('page:load', initialize);

function remove_fields(link) {
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest(".fields").slideUp(400, updateOnscreenNumbers);//.hide();
    updateButtons(link);
}

function remove_field(link) {
    $(link).prev("input[type=hidden]").val("1");
    updateButtons(link);
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
    hideAnswers();
    updateButtons(link);
    updateOnscreenNumbers();
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
	remove_field($(select).nextAll(".answer:not(:first)").children("a"));
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

function dealWithAddQuestionButton() {
	$(".add_question_button").show();
	var numberOfVisibleQuestions = $(".question_box").children(".question").filter(":visible").length;

	if (numberOfVisibleQuestions >= 10) {
		$(".add_question_button").hide();
	}
}

function dealWithRemoveQuestionButton(link) {
	dealWithAddQuestionButton($(link).parent().parent().parent().nextAll(".add_question_button").children());
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
	

	//$(link).nextAll(".answer").children("label").text("Wrong Answer");
	//$(link).nextAll(".answer").children("label").first().text("Correct Answer");
}

function updateOnscreenNumbers(){
	setQuestionNumber();
	setAnswerNumber();
	dealWithAddQuestionButton();
}

function updateButtons(link){
	dealWithRemoveQuestionButton(link);
	dealWithAddAnswerButton(link);
	dealWithRemoveAnswerButton(link);
}