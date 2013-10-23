function showQuiz(button){
    var quiz, options

	quiz = createQuizObject();
	options = [];

	for (var i=0; i < gon.questions.length; i++) 
	{
		switch(gon.questions[i].category)
		{
		case "multiList":
			quiz.multiList.push({ques   : gon.questions[i].content, 
								 ans    : gon.questions[i].multiple_answer,
								 ansInfo: gon.questions[i].explaination
								});
			break;
		case "multi":
			quiz.multi.push({ques   : gon.questions[i].content, 
							 ans    : gon.questions[i].multiple_answer,
							 ansInfo: gon.questions[i].explaination
							});
			break;
		case "tf":
			quiz.tf.push({ques   : gon.questions[i].content, 
						  ans    :  gon.questions[i].tf_answer,
						  ansInfo: gon.questions[i].explaination
						});
			break;
		case "fill":
			quiz.fill.push({ques   : gon.questions[i].content, 
				 			ans    : gon.questions[i].fill_answer,
				 			ansInfo: gon.questions[i].explaination
				 		});
			break;
		}
	}

	var quizMulti = {
	        multiList:[
	                { ques: "opposite / hypotonus", ans: "sin", ansSel : "tan" },
	                { ques: "adjacent / hypotonus", ans: "cos", ansSel: "tan" }
	        ],
	        tf:[
	                { ques: "cos( 30 degrees )", ans: "&#8730;3 / 2", ansSel: [ " &#8730;2 / 3", "1/4" ] },
	                { ques: "sin( 60 degrees )", ans: "&#8730;3 / 2", ansSel: [ "1/2", "&#8730;2" ] }       
	        ],
	        fill:[
	                { ques: "1/tan", ans: "cot" },
	                { ques: "1/cos", ans: "sec" }
	        ]
	};

	options = { allRandom: 		gon.quiz.random,
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
    $(button).hide();
}

jQuery(function(){
        //console.log(gon.quiz);
        //console.log(gon.questions);
        //console.log(quiz);
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
				types.tf = [];
				break;
		}
	}
	return types;
}