class QuizzesController < ApplicationController
	before_action :signed_in_user
	
	def new
		@quiz = current_user.quizzes.build if signed_in?
	end
	
	def create
		@quiz = current_user.quizzes.build(quiz_params)
		if @quiz.save
			flash[:success] = "New quiz created!"
			redirect_to browse_path
		else
			render new_quiz_path
		end
	end
	
	def destroy
	end
	
	private
	
		def quiz_params
			params.require(:quiz).permit(:name, :description, :help_text)
		end	
end