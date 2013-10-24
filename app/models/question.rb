class Question < ActiveRecord::Base
	belongs_to :quiz
	has_many :answers, dependent: :destroy
	validates :category, 
				presence: true, 
				format: {with: /(^tf\z)|(^fill\z)|(^multi\z)|(^multiList\z)/i }
	validates :content, presence: true
end