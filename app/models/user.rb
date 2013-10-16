class User < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 100 }
	validates :email, 
		presence: true, 
		format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
		uniqueness: { case_sensitive: false }
end
