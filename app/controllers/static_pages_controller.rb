class StaticPagesController < ApplicationController
  def home
  	@quizzes = Quiz.all(:order => 'access_count DESC')
  end

  def about
  end
  
  def browse
	@quizzes = Quiz.all
  end
end
