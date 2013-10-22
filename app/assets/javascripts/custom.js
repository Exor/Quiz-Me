function remove_fields(link){
	$(link).prev("input[type=hidden]").val("1");
	$(link).closest(".fields").hide();
}

function add_question(link){
	var number = $("h2:contains('Question')").get().length;

	var strVar="";
	strVar += "<fieldset class=\"fields\">";
	strVar += "<h2>Question<\/h2>";
	strVar += "<input id=\"quiz_questions_attributes_";strVar += number;strVar += "__destroy\" name=\"quiz[questions_attributes][";strVar += number;strVar += "][_destroy]\" type=\"hidden\" value=\"false\" \/>";
	strVar += "<a href=\"#\" onclick=\"remove_fields(this); return false;\">Remove Question<\/a>";
	strVar += "<label for=\"quiz_questions_attributes_";strVar += number;strVar += "_category\">Type<\/label>";
	strVar += "<select id=\"quiz_questions_attributes_";strVar += number;strVar += "_category\" name=\"quiz[questions_attributes][";strVar += number;strVar += "][category]\"><option value=\"tf\">True\/False<\/option>";
	strVar += "<option value=\"fill\">Fill in the Blank<\/option>";
	strVar += "<option value=\"multi\">Multiple Choice<\/option><\/select>";
	strVar += "<label for=\"quiz_questions_attributes_";strVar += number;strVar += "_content\">Question<\/label>";
	strVar += "<input id=\"quiz_questions_attributes_";strVar += number;strVar += "_content\" name=\"quiz[questions_attributes][";strVar += number;strVar += "][content]\" type=\"text\" \/>";
	strVar += "<label for=\"quiz_questions_attributes_";strVar += number;strVar += "_fill_answer\">Fill Answer<\/label>";
	strVar += "<input id=\"quiz_questions_attributes_";strVar += number;strVar += "_fill_answer\" name=\"quiz[questions_attributes][";strVar += number;strVar += "][fill_answer]\" type=\"text\" \/>";
	strVar += "<label for=\"quiz_questions_attributes_";strVar += number;strVar += "_tf_answer\">True False Answer<\/label>";
	strVar += "<input id=\"quiz_questions_attributes_";strVar += number;strVar += "_tf_answer_t\" name=\"quiz[questions_attributes][";strVar += number;strVar += "][tf_answer]\" type=\"radio\" value=\"t\" \/>True";
	strVar += "<input id=\"quiz_questions_attributes_";strVar += number;strVar += "_tf_answer_f\" name=\"quiz[questions_attributes][";strVar += number;strVar += "][tf_answer]\" type=\"radio\" value=\"f\" \/>False";
	strVar += "<label for=\"quiz_questions_attributes_";strVar += number;strVar += "_multiple_answer\">Multiple Choice Answer<\/label>";
	strVar += "<input id=\"quiz_questions_attributes_";strVar += number;strVar += "_multiple_answer\" name=\"quiz[questions_attributes][";strVar += number;strVar += "][multiple_answer]\" type=\"text\" \/>";
	strVar += "<label for=\"quiz_questions_attributes_";strVar += number;strVar += "_explaination\">Explanation<\/label>";
	strVar += "<input id=\"quiz_questions_attributes_";strVar += number;strVar += "_explaination\" name=\"quiz[questions_attributes][";strVar += number;strVar += "][explaination]\" type=\"text\" \/>";
	strVar += "<\/fieldset>";


	$(link).before(strVar);
}