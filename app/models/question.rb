class Question < ActiveRecord::Base
	belongs_to :quiz
	validates :category, 
				presence: true, 
				format: {with: /(^tf\z)|(^fill\z)|(^multi\z)|(^multiList\z)/i }
	validates :content, presence: true
	validates :tf_answer, presence: true, if: :tf_question?
	validates :fill_answer, presence: true, if: :fill_question?
	validates :multiple_answer, presence: true, if: :multi_question?
end

	def tf_question?
		category == "tf"
	end
	
	def fill_question?
		category == "fill"
	end
	
	def multi_question?
		category == "multi" || category == "multiList"
	end