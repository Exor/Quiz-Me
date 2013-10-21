class Quiz < ActiveRecord::Base
	belongs_to :user
	has_many :questions, dependent: :destroy
	accepts_nested_attributes_for :questions, allow_destroy: true
	default_scope -> { order('created_at DESC') }
	validates :user_id, presence: true
	validates :name, presence: true
end
