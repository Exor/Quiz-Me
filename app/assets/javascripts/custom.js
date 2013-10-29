function remove_question(link){
	$(link).prev("input[type=hidden]").val("1");
	$(link).closest(".question_fields").hide();
}

function remove_answer(link){
	$(link).prev("input[type=hidden]").val("1");
	$(link).closest(".answer_fields").hide();
}

function add_question(link){
	var index = $("h2:contains('Question')").get().length;

	var strVar="";
	strVar += "<fieldset class=\"question_fields\">";
	strVar += "<h2>Question<\/h2>";
	
	strVar += "<input id=\"quiz_questions_attributes_";strVar += index;strVar += "__destroy\" name=\"quiz[questions_attributes][";strVar += index;strVar += "][_destroy]\" type=\"hidden\" value=\"false\" \/>";
	strVar += "<a href=\"#\" onclick=\"remove_question(this); return false;\">Remove Question<\/a>";
	
	strVar += "<label for=\"quiz_questions_attributes_";strVar += index;strVar += "_category\">Type<\/label>";
	strVar += "<select class=\"questiontype\" id=\"quiz_questions_attributes_";strVar += index;strVar += "_category\" name=\"quiz[questions_attributes][";strVar += index;strVar += "][category]\" onChange=\"changeType(this)\">";
	strVar += "<option value=\"\">-- Choose a Type --<\/option>";
	strVar += "<option value=\"tf\">True\/False<\/option>";
	strVar += "<option value=\"fill\">Fill in the Blank<\/option>";
	strVar += "<option value=\"multi\">Multiple Choice Dropdown<\/option>";
	strVar += "<option value=\"multiList\">Multiple Choice Radio Button<\/option><\/select>";

	strVar += "<label for=\"quiz_questions_attributes_";strVar += index;strVar += "_content\">Question<\/label>";
	strVar += "<input id=\"quiz_questions_attributes_";strVar += index;strVar += "_content\" name=\"quiz[questions_attributes][";strVar += index;strVar += "][content]\" type=\"text\" \/>";

	strVar += "<fieldset class=\"answer_fields\">";

	//strVar += "<input class=\"add_remove_answer_link\" id=\"quiz_questions_attributes_";strVar += index;strVar += "_answers_attributes_0__destroy\" name=\"quiz[questions_attributes][";strVar += index;strVar += "][answers_attributes][0][_destroy]\" type=\"hidden\" value=\"false\" \/>";
	//strVar += "<a class=\"add_remove_answer_link\" href=\"#\" onclick=\"remove_answer(this); return false;\">Remove Answer<\/a>";
	
	strVar += "<p class=\"fillanswer\">";
	strVar += "<label for=\"quiz_questions_attributes_";strVar += index;strVar += "_answers_attributes_0_content\">Answer<\/label>";
	strVar += "<input id=\"quiz_questions_attributes_";strVar += index;strVar += "_answers_attributes_0_content\" name=\"quiz[questions_attributes][";strVar += index;strVar += "][answers_attributes][0][content]\" type=\"text\" \/>";
	strVar += "<\/p>";
	
	strVar += "<p class=\"tfanswer\">";
	strVar += "<label for=\"quiz_questions_attributes_";strVar += index;strVar += "_answers_attributes_0_content\">Answer<\/label>";
	strVar += "<input id=\"quiz_questions_attributes_";strVar += index;strVar += "_answers_attributes_0_content_t\" name=\"quiz[questions_attributes][";strVar += index;strVar += "][answers_attributes][0][content]\" type=\"radio\" value=\"t\" \/>True";
	strVar += "<input id=\"quiz_questions_attributes_";strVar += index;strVar += "_answers_attributes_0_content_f\" name=\"quiz[questions_attributes][";strVar += index;strVar += "][answers_attributes][0][content]\" type=\"radio\" value=\"f\" \/>False";
	strVar += "<\/p>";

	strVar += "<\/fieldset>";

	strVar += "<a class=\"add_remove_answer_link\" href=\"#\" onclick=\"add_answer(this, ";strVar += index;strVar += "); return false;\">Add Answer<\/a>";

	strVar += "<label for=\"quiz_questions_attributes_";strVar += index;strVar += "_explanation\">Explanation<\/label>";
	strVar += "<input id=\"quiz_questions_attributes_";strVar += index;strVar += "_explanation\" name=\"quiz[questions_attributes][";strVar += index;strVar += "][explanation]\" type=\"text\" \/>";
	strVar += "<\/fieldset>";


	$(link).before(strVar);

	hideAnswers();
}

function add_answer(link, question_index){
	var answer_index = $("label:contains('Answer')").get().length;	

	var strVar="";
	strVar += "<fieldset class=\"answer_fields\">";

	strVar += "<input class=\"add_remove_answer_link\" id=\"quiz_questions_attributes_";strVar += question_index;strVar += "_answers_attributes_";strVar += answer_index;strVar += "__destroy\" name=\"quiz[questions_attributes][";strVar += question_index;strVar += "][answers_attributes][";strVar += answer_index;strVar += "][_destroy]\" type=\"hidden\" value=\"false\" \/>";
	strVar += "<a class=\"add_remove_answer_link\" href=\"#\" onclick=\"remove_answer(this); return false;\">Remove Answer<\/a>";

	strVar += "<p class=\"fillanswer\">";
	strVar += "<label for=\"quiz_questions_attributes_";strVar += question_index;strVar += "_answers_attributes_";strVar += answer_index;strVar += "_content\">Answer<\/label>";
	strVar += "<input id=\"quiz_questions_attributes_";strVar += question_index;strVar += "_answers_attributes_";strVar += answer_index;strVar += "_content\" name=\"quiz[questions_attributes][";strVar += question_index;strVar += "][answers_attributes][";strVar += answer_index;strVar += "][content]\" type=\"text\" \/>";
	strVar += "<\/p>";

	strVar += "<\/fieldset>";

	$(link).before(strVar);
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