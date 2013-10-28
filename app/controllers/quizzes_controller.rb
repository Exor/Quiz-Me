class QuizzesController < ApplicationController
	before_action :signed_in_user, only: [:new, :create, :destroy, :edit, :update]
	before_action :correct_user, only: [:destroy, :edit, :update]
	
	def show
		@quiz = Quiz.find(params[:id])
		@questions = Quiz.find(params[:id]).questions
		@answers = []
		gon.quiz = Quiz.find(params[:id])
		gon.questions = Quiz.find(params[:id]).questions
		gon.answers = []
		Quiz.find(params[:id]).questions.each do |question|
			gon.answers.push(question.answers)
			@answers.push(question.answers)
		end
	end

	def new
		@quiz = current_user.quizzes.build if signed_in?
	end
	
	def create
		@quiz = current_user.quizzes.build(quiz_params)
		@quiz.questions.build if @quiz.questions.blank?
		if @quiz.save
			flash[:success] = "New quiz created!"
			redirect_to browse_path
		else
			render new_quiz_path
		end
	end

	def edit
	end
	
	def update
		if @quiz.update_attributes(quiz_params)
			flash[:success] = "Quiz updated"
			redirect_to browse_path
		else
			render 'edit'
		end
	end
	
	def destroy
		@quiz.destroy
		redirect_to browse_path
	end
	
	private
	
		def quiz_params
			params.require(:quiz).permit(:name, 
										 :description, 
										 :help_text, 
										 :random, 
										 :allow_restart,
										 :allow_delete,
										 :allow_review,
										 :show_answer,
										 :show_explaination,
										 :questions_attributes => [:id,
										 						   :content,
										 						   :category,
										 						   :_destroy,
										 						   :answers_attributes => [:id,
										 						   						   :content,
										 						   						   :explanation,
										 						   						   :_destroy
										 						   										]])
		end	
		
		def correct_user
			@quiz = current_user.quizzes.find_by(id: params[:id])
			redirect_to root_url if @quiz.nil?
		end
end