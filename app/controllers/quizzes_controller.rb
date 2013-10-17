class QuizzesController < ApplicationController
	before_action :signed_in_user
	before_action :correct_user, only: :destroy
	
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
		@quiz.destroy
		redirect_to browse_path
	end
	
	private
	
		def quiz_params
			params.require(:quiz).permit(:name, :description, :help_text)
		end	
		
		def correct_user
			@quiz = current_user.quizzes.find_by(id: params[:id])
			redirect_to root_url if @quiz.nil?
		end
end