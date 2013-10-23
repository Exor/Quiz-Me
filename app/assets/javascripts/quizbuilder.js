var quiz, options
quiz = [{ ques : "2 + 2", ans : "4" }]
options = {quizType: "fill"}

$(document).on("page:change",showQuiz())

function showQuiz(button){
        $(button).hide();
        $( "#quizarea" ).jQuizMe( quiz, options );
}