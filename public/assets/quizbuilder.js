function getSelection(jsonObject){
	a = [];
	for (var i=1; i < jsonObject.length; i++)
		{a.push(jsonObject[i].content);}
	return a;
}

function embedQuiz(quiz_json, questions_json, answers_json){
	var quiz = JSON.parse(quiz_json);
	var questions = JSON.parse(questions_json);
	var answers = JSON.parse(answers_json);
	console.log(quiz);
	console.log(questions);
	console.log(answers);
	showQuiz(quiz, questions, answers);
}

function loadQuiz(){
	showQuiz(gon.quiz, gon.questions, gon.answers);
}

function showQuiz(quiz, questions, answers){
    var options

	quiz = createQuizObject(questions);
	options = [];

	for (var i=0; i < questions.length; i++) 
	{
		switch(questions[i].category)
		{
		case "multiList":
			var selection = getSelection(answers[i])
			quiz.multiList.push({ques   : questions[i].content, 
								 ans    : answers[i][0].content,
								 ansSel : selection,
								 ansInfo: questions[i].explanation
								});
			break;
		case "multi":
			var selection = getSelection(answers[i])
			quiz.multi.push({ques   : questions[i].content, 
							 ans    : answers[i][0].content,
							 ansSel : selection,
							 ansInfo: questions[i].explanation
							});
			break;
		case "tf":
			var answer = 'true';
			var subanswer = [null, 'false'];
			if (answers[i][0].content == 'f')
				{
					answer = 'false';
					subanswer = ['true', null];
				}
			quiz.multiList.push({ques   : questions[i].content, 
						  ans    : answer,
						  ansSel : subanswer,
						  ansInfo: questions[i].explaination
						});
			break;
		case "fill":
			quiz.fill.push({ques   : questions[i].content, 
				 			ans    : answers[i][0].content,
				 			ansInfo: questions[i].explanation
				 		});
			break;
		}
	}

	options = { allRandom: 		false, //quiz.random,
				help: 			quiz.help_text,
				intro: 			quiz.description,
				review: 		quiz.allow_review,
				showAns: 		quiz.show_answer,
				showAnsInfo: 	quiz.show_explaination,
				title: 			quiz.name,
				disableRestart: !quiz.allow_restart,
				disableDelete:  !quiz.allow_delete
	}
    
    $( "#quizarea" ).jQuizMe( quiz, options );
}

function createQuizObject(questions){
	var types = new Object();
	for (var i=0; i < questions.length; i++) 
	{
		switch(questions[i].category)
		{
			case("fill"):
				types.fill = [];
				break;
			case("multi"):
				types.multi = [];
				break;
			case("multiList"):
				types.multiList = [];
				break;
			case("tf"):
				types.multiList = [];
				break;
		}
	}
	return types;
}