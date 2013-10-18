class QuestionsController < ApplicationController
	before_action :signed_in_user

	def create
		@question = current_quiz.questions.build(question_params)
		if @question.save
			#success
		else
			#failure
		end
	end
	
	def destroy
	end
	
	def edit
	end
	
	def update
	end
end

	private
		def question_params
			params.require(:question).permit(:number, 
											 :category, 
											 :content, 
											 :fill_answer, 
											 :tf_answer, 
											 :multiple_answer, 
											 :explaination)
		end