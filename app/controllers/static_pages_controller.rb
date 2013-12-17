class StaticPagesController < ApplicationController
  def home
  	@quizzes = Quiz.all(:order => 'access_count DESC') #.first(3)
  end

  def about
  end
  
  def browse
	@quizzes = Quiz.all
  end
end
