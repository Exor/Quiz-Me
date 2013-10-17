class StaticPagesController < ApplicationController
  def home
  end

  def about
  end
  
  def browse
	@quizzes = Quiz.all
  end
end
