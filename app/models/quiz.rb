class Quiz < ActiveRecord::Base
	belongs_to :user
	has_many :questions, dependent: :destroy
	before_create :create_unique_url
	accepts_nested_attributes_for :questions, allow_destroy: true
	default_scope -> { order('created_at DESC') }
	validates :user_id, presence: true
	validates :name, presence: true
	validates :questions, presence: true



	private 
		def create_unique_url
			s = [SecureRandom.random_bytes(7)].pack("m*")
		  	s.delete!("\n")
		  	s.delete!("+/")
		  	s.delete!("=")
			self.unique_url = s
		end
end