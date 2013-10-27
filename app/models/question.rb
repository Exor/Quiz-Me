class Question < ActiveRecord::Base
	belongs_to :quiz
	has_many :answers, dependent: :destroy
	accepts_nested_attributes_for :answers, allow_destroy: true, :reject_if => lambda { |a| a[:content].blank? }
	validates :category, 
				presence: true, 
				format: {with: /(^tf\z)|(^fill\z)|(^multi\z)|(^multiList\z)/i }
	validates :content, presence: true
end