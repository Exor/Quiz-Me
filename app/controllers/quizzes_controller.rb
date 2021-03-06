class QuizzesController < ApplicationController
	before_action :signed_in_user, only: [:new, :create, :destroy, :edit, :update]
	before_action :correct_user, only: [:destroy, :edit, :update]
	
	def show
		@quiz = Quiz.friendly.find(params[:id])
		@questions = Quiz.friendly.find(params[:id]).questions
		@answers = []
		Quiz.friendly.find(params[:id]).questions.each do |question|
			@answers.push(question.answers)
		end
	end

	def new
		if signed_in?
			@quiz = current_user.quizzes.build
			@question = @quiz.questions.build
			@question.answers.build
		end
	end
	
	def create
		@quiz = current_user.quizzes.build(quiz_params)
		@quiz.description = " " if @quiz.description.blank?
		if @quiz.save
			flash[:success] = "New quiz successfully created!"
			redirect_to browse_path
		else
			render new_quiz_path
		end
	end

	def edit
		@quiz.description = nil if @quiz.description.blank?
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
		flash[:success] = "Quiz deleted"
		redirect_to browse_path
	end

	def increase
		render :nothing => true
		@quiz = Quiz.friendly.find(params[:id])
		@quiz.increment(:access_count, by = 1)
		@quiz.save
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
			@quiz = current_user.quizzes.find_by(unique_url: params[:id])
			redirect_to root_url if @quiz.nil?
		end
end