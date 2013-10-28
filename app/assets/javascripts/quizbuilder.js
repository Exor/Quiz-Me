function getSelection(jsonObject){
	a = [];
	for (var i=1; i < jsonObject.length; i++)
		{a.push(jsonObject[i].content);}
	console.log(a);
	return a;
}

function showQuiz(quizNumber){


}

function showQuiz(){
    var quiz, options

	quiz = createQuizObject();
	options = [];

	for (var i=0; i < gon.questions.length; i++) 
	{
		switch(gon.questions[i].category)
		{
		case "multiList":
			var selection = getSelection(gon.answers[i])
			quiz.multiList.push({ques   : gon.questions[i].content, 
								 ans    : gon.answers[i][0].content,
								 ansSel : selection,
								 ansInfo: gon.questions[i].explanation
								});
			break;
		case "multi":
			var selection = getSelection(gon.answers[i])
			quiz.multi.push({ques   : gon.questions[i].content, 
							 ans    : gon.answers[i][0].content,
							 ansSel : selection,
							 ansInfo: gon.questions[i].explanation
							});
			break;
		case "tf":
			var answer = 'true';
			var subanswer = [null, 'false'];
			if (gon.answers[i][0].content == 'f')
				{
					answer = 'false';
					subanswer = ['true', null];
				}
			quiz.multiList.push({ques   : gon.questions[i].content, 
						  ans    : answer,
						  ansSel : subanswer,
						  ansInfo: gon.questions[i].explaination
						});
			break;
		case "fill":
			quiz.fill.push({ques   : gon.questions[i].content, 
				 			ans    : gon.answers[i][0].content,
				 			ansInfo: gon.questions[i].explanation
				 		});
			break;
		}
	}

	options = { allRandom: 		false, //gon.quiz.random,
				help: 			gon.quiz.help_text,
				intro: 			gon.quiz.description,
				review: 		gon.quiz.allow_review,
				showAns: 		gon.quiz.show_answer,
				showAnsInfo: 	gon.quiz.show_explaination,
				title: 			gon.quiz.name,
				disableRestart: !gon.quiz.allow_restart,
				disableDelete:  !gon.quiz.allow_delete
	}
    
    $( "#quizarea" ).jQuizMe( quiz, options );
}

jQuery(function(){
        //console.log(gon.quiz);
        //console.log(gon.questions);
        //console.log(quiz);
        //console.log(gon.answers);
});

function createQuizObject(){
	var types = new Object();
	for (var i=0; i < gon.questions.length; i++) 
	{
		switch(gon.questions[i].category)
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