class Question < ActiveRecord::Base
	belongs_to :quiz
	validates :quiz_id, presence: true
	validates :number, presence: true
	validates :category, 
				presence: true, 
				format: {with: /(^tf\z)|(^fill\z)|(^multi\z)/i }
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
		category == "multi"
	end